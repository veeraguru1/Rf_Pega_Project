import os.path

if os.path.isfile(os.path.join(os.path.dirname(__file__), 'local.py')):
    from local import *
else:
    from defaults import *