CC ?= gcc
CFLAGS ?= -O3 -fPIC -Wall -Wextra
LDFLAGS ?= -shared -lncursesw -ldl
TARGET = cmatrix_transparent.so
DESTDIR ?= $(HOME)/.local/lib

all: $(TARGET)

$(TARGET): cmatrix_transparent.c
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

install: $(TARGET)
	mkdir -p $(DESTDIR)
	install -m 755 $(TARGET) $(DESTDIR)/$(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: all install clean
