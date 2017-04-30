#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import curses
from curses import wrapper

class Game:
    def init(self):
        """start a curses session"""
        stdscr = curses.initscr()
        # don't echo keyboard to screen
        curses.noecho()
        # accept keyboard input immediately, don't wait for enter
        curses.cbreak()
        # let curses translate special key entry like curses.KEY_LEFT
        stdscr.keypad(True)

    def destroy(self):
        curses.nocbreak()
        stdscr.keypad(False)
        curses.echo()


def main(stdscr):
    # clear screen
    stdscr.clear()

    fill_characters = '▤▥▦▦▦' + '╃╄╅╆╇'
    width = 100

    # This raises ZeroDivisionError when i == 10.
    for i, l in enumerate(fill_characters):
        stdscr.addstr(i, 0, (l * width))

    stdscr.refresh()
    stdscr.getkey()


if __name__ == "__main__":
    wrapper(main)
