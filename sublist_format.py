#! /usr/bin/env python

# Sublist formatter
#
# Formats sublist for bash script, so client can write with newlines.
#
# James Roseman
# May, 2013

import sys

def main (argv):
    f = open('sublist')
    new_sublist = f.read().replace('\n', '+')[:-1]
    f.close()
    f = open('.sublist', 'w')
    f.write(new_sublist)
    f.close()

if __name__ == "__main__":
    main (sys.argv[1:])
