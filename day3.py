#!/usr/bin/env python3
# vim: set fileencoding=utf-8 :

import sys
from itertools import product

__appname__     = "day3"
__author__      = "@AUTHOR@"
__copyright__   = ""
__credits__     = ["@AUTHOR@"]  # Authors and bug reporters
__license__     = "GPL"
__version__     = "1.0"
__maintainers__ = "@AUTHOR@"
__email__       = "@EMAIL@"
__status__      = "Prototype"  # "Prototype", "Development" or "Production"
__module__      = ""


class Claim():
    def __init__(self, s):
        id_, _, coord, size = s.split()
        coord = coord.strip(':').split(',')
        size = tuple(int(c) for c in size.split('x'))
        startcoord = tuple(int(c) for c in coord)
        endcoord = (startcoord[0] + size[0] - 1, startcoord[1] + size[1] - 1)
        self.coords = set(product(range(startcoord[0], endcoord[0] + 1),
            range(startcoord[1], endcoord[1] + 1)))
        self.id_ = id_

    def overlaps(self, other):
        for coord in self.coords:
            if coord in other.coords:
                return True
        return False

    def __repr__(self):
        return "Claim(id={})".format(self.id_)

l = set(Claim(l) for l in sys.stdin.read().strip().split("\n"))


overlapping = set()

for claim in l:
    if claim in overlapping:
        continue
    for claim2 in l:
        if claim2 in overlapping or claim2 is claim:
            continue
        if claim.overlaps(claim2):
            overlapping.add(claim)
            overlapping.add(claim2)

print(l.difference(overlapping))

for thing in l.difference(overlapping):
    for claim in l:
        if thing is claim:
            continue
        if thing.overlaps(claim):
            overlapping.add(thing)

print(l.difference(overlapping))
