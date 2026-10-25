#!/usr/bin/env python3
"""Sync Antigravity CLI theme with Matugen palette.

Updates ~/.gemini/antigravity-cli/settings.json, jetski_state.pbtxt,
and ~/.gemini/antigravity/antigravity_state.pbtxt so Antigravity CLI
always reflects the active wallpaper and theme colors.
"""

from __future__ import annotations

import json
import os
import re
from pathlib import Path

HOME = Path.home()
GENERATED_THEME = HOME / ".config" / "matugen" / "generated" / "antigravity.json"
FALLBACK_TUI = HOME / ".config" / "matugen" / "generated" / "dusky_tui.json"
SETTINGS_JSON = HOME / ".gemini" / "antigravity-cli" / "settings.json"
JETSKI_PBTXT = HOME / ".gemini" / "antigravity-cli" / "jetski_state.pbtxt"
ANTIGRAVITY_PBTXT = HOME / ".gemini" / "antigravity" / "antigravity_state.pbtxt"


def get_colors() -> dict[str, str]:
    if GENERATED_THEME.is_file():
        try:
            with open(GENERATED_THEME, "r", encoding="utf-8") as f:
                return json.load(f)
        except Exception:
            pass

    if FALLBACK_TUI.is_file():
        try:
            with open(FALLBACK_TUI, "r", encoding="utf-8") as f:
                tui = json.load(f)
            return {
                "background": tui.get("bg", "#191112"),
                "primary": tui.get("accent", "#ffb2be"),
                "foreground_override": tui.get("fg", "#f0dee0"),
                "primary_foreground_override": "#3d0400",
                "code_foreground_override": tui.get("accent", "#ffb2be"),
            }
        except Exception:
            pass

    return {
        "background": "#191112",
        "primary": "#ffb2be",
        "foreground_override": "#f0dee0",
        "primary_foreground_override": "#3d0400",
        "code_foreground_override": "#ffb2be",
    }


def update_settings_json(colors: dict[str, str]) -> None:
    if not SETTINGS_JSON.parent.is_dir():
        SETTINGS_JSON.parent.mkdir(parents=True, exist_ok=True)

    settings = {}
    if SETTINGS_JSON.is_file():
        try:
            with open(SETTINGS_JSON, "r", encoding="utf-8") as f:
                settings = json.load(f)
        except Exception:
            settings = {}

    settings["seasonalThemesOff"] = "halloween-2026"
    settings["seasonalThemesOptIn"] = ""
    settings["colorScheme"] = "terminal"
    settings["customThemeSeedsDark"] = {
        "background": colors.get("background", "#191112"),
        "primary": colors.get("primary", "#ffb2be"),
        "foreground_override": colors.get("foreground_override", "#f0dee0"),
        "primary_foreground_override": colors.get("primary_foreground_override", "#3d0400"),
        "code_foreground_override": colors.get("code_foreground_override", "#ffb2be"),
    }

    tmp_file = SETTINGS_JSON.with_suffix(".tmp")
    with open(tmp_file, "w", encoding="utf-8") as f:
        json.dump(settings, f, indent=2)
    tmp_file.replace(SETTINGS_JSON)


def update_pbtxt(path: Path, colors: dict[str, str]) -> None:
    if not path.parent.is_dir():
        path.parent.mkdir(parents=True, exist_ok=True)

    content = ""
    if path.is_file():
        try:
            with open(path, "r", encoding="utf-8") as f:
                content = f.read()
        except Exception:
            content = ""

    content = re.sub(r"\n?custom_theme_seeds_dark\s*:\s*\{[^}]*\}\n?", "\n", content).rstrip()

    block = f"""
custom_theme_seeds_dark: {{
  background: "{colors.get("background", "#191112")}"
  primary: "{colors.get("primary", "#ffb2be")}"
  foreground_override: "{colors.get("foreground_override", "#f0dee0")}"
  primary_foreground_override: "{colors.get("primary_foreground_override", "#3d0400")}"
  code_foreground_override: "{colors.get("code_foreground_override", "#ffb2be")}"
}}
"""
    new_content = (content + block).strip() + "\n"

    tmp_file = path.with_suffix(".tmp")
    with open(tmp_file, "w", encoding="utf-8") as f:
        f.write(new_content)
    tmp_file.replace(path)


def main() -> None:
    colors = get_colors()
    update_settings_json(colors)
    update_pbtxt(JETSKI_PBTXT, colors)
    update_pbtxt(ANTIGRAVITY_PBTXT, colors)


if __name__ == "__main__":
    main()
