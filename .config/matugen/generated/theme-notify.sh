#!/usr/bin/env bash

# Matugen injects these dynamically. Zero subshells or forks used.
c_1="#dac76f"
c_2="#d1c6a2"
c_3="#a9d0b4"
c_4="#524600"
c_5="#4d472b"

# U+25CF (Black Circle) with Pango color spans
dots="<span color='${c_1}'>●</span> <span color='${c_2}'>●</span> <span color='${c_3}'>●</span> <span color='${c_4}'>●</span> <span color='${c_5}'>●</span>"

# Sending as Body (3rd positional argument) because Summary does not parse markup.
notify-send -a "matugen-theme" -h string:x-canonical-private-synchronous:sys-theme "theme" "${dots}"
