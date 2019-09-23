import sys, os

print('Python version: {}'.format(sys.version))

import tqdm
print(f'tqdm version: {tqdm.__version__}')

print('That`s it folks.')
print("")

print('User home dir: ', os.path.expanduser('~'))

print ('Argument List:', str(sys.argv))

import argparse

parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('integers', metavar='N', type=int, nargs='+',
                   help='an integer for the accumulator')

args = parser.parse_args()
print(args.integers)
