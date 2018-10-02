#!/usr/bin/env python

import pstats
import argparse
import sys

if __name__ == '__main__':
    help_string = 'Run this script on the output of python -m cProfile -o test.dat somescript.py'
    parser = argparse.ArgumentParser(description='.')
    parser.add_argument('file', type=str, help=help_string)

    try:
        args = parser.parse_args()
    except:
        print(help_string)
        sys.exit(0)

    print("Analyzing: {}".format(args.file))
    stats = pstats.Stats(args.file)
    stats.strip_dirs().sort_stats('cumulative')
    stats.print_stats(30)
