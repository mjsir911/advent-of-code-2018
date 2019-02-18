#!/usr/bin/env python3
# vim: set fileencoding=utf-8 :

from collections import Counter
import sys

__appname__     = "puzzle2"
__author__      = "@AUTHOR@"
__copyright__   = ""
__credits__     = ["@AUTHOR@"]  # Authors and bug reporters
__license__     = "GPL"
__version__     = "1.0"
__maintainers__ = "@AUTHOR@"
__email__       = "@EMAIL@"
__status__      = "Prototype"  # "Prototype", "Development" or "Production"
__module__      = ""


#with open("inputs/day2.txt") as file:
l = sys.stdin.read().strip().split()


def part1(l):
    a = Counter(c for x in l for c in set(Counter(x).values()))
    return a[2] * a[3]


print(part1(l))
