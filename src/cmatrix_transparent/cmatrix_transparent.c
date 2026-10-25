#define _GNU_SOURCE
#include <dlfcn.h>
#include <ncurses.h>

static int (*real_start_color)(void) = NULL;
static int (*real_init_pair)(short, short, short) = NULL;

int start_color(void) {
    if (!real_start_color) {
        real_start_color = (int (*)(void))dlsym(RTLD_NEXT, "start_color");
    }
    int res = real_start_color ? real_start_color() : ERR;
    use_default_colors();
    return res;
}

int init_pair(short pair, short f, short b) {
    (void)b;
    if (!real_init_pair) {
        real_init_pair = (int (*)(short, short, short))dlsym(RTLD_NEXT, "init_pair");
    }
    // Force transparent background (-1: default terminal background)
    return real_init_pair ? real_init_pair(pair, f, -1) : ERR;
}
