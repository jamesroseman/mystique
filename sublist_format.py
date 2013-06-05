#! /usr/bin/env python

# Sublist formatter
#
# Formats sublist for bash script, so client can write with newlines.
#
# James Roseman
# May, 2013

import sys

def main (argv):
    templines = []
    f = open('sublist')
    for line in f:
        if line.strip().startswith("#"):
            pass
        else:
            templines.append(line.strip()+"+")
    f.close()

    f = open('.sublist', 'w')
    f.write('+'.join(templines)[:-1].replace("++", "+"))
    f.close()

if __name__ == "__main__":
    main (sys.argv[1:])
