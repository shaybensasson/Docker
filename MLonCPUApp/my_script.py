import sys
import numpy as np

print('Python version: {}'.format(sys.version))
print('')
print('Just a random number: {}'.format(np.random.rand()))

import tqdm
print(f'tqdm version: {tqdm.__version__}')

print('That it folks.')
print("")

for name, module in sorted(sys.modules.items()): 
	if hasattr(module, '__version__'): 
 		print ((name, module.__version__))
