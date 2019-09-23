import sys, os

print('Python version: {}'.format(sys.version))

import tqdm
print(f'tqdm version: {tqdm.__version__}')

print('That`s it folks.')
print("")

print('User home dir: ', os.path.expanduser('~'))

print ('Argument List:', str(sys.argv))
