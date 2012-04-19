import sys
import os
from os.path import *

import envoy

def query_yes_no(question, default="yes"):
    """Ask a yes/no question via raw_input() and return their answer.

    "question" is a string that is presented to the user.
    "default" is the presumed answer if the user just hits <Enter>.
        It must be "yes" (the default), "no" or None (meaning
        an answer is required of the user).

    The "answer" return value is one of "yes" or "no".
    """
    valid = {"yes":True,   "y":True,  "ye":True,
             "no":False,     "n":False}
    if default == None:
        prompt = " [y/n] "
    elif default == "yes":
        prompt = " [Y/n] "
    elif default == "no":
        prompt = " [y/N] "
    else:
        raise ValueError("invalid default answer: '%s'" % default)

    while True:
        sys.stdout.write(question + prompt)
        choice = raw_input().lower()
        if default is not None and choice == '':
            return valid[default]
        elif choice in valid:
            return valid[choice]
        else:
            sys.stdout.write("Please respond with 'yes' or 'no' "\
                             "(or 'y' or 'n').\n")

IGNORED = ['make_links.py', '.git', 'old']

if __name__ == '__main__':
	install_dir = abspath(expanduser('~'))
	script_path = abspath(__file__)
	source_dir = dirname(script_path)
	if len(sys.argv) > 2:
		source_dir = abspath(expanduser(sys.argv[1]))
		install_dir = abspath(expanduser(sys.argv[2]))

	old_files = join(source_dir, 'old')
	print('installing from %s to %s' % (source_dir, install_dir))
	if query_yes_no('Continue?'):
		for f in os.listdir(source_dir):
			if f in IGNORED:
				continue
			src = join(source_dir, f)
			dst = join(install_dir, f)
			if realpath(src) == realpath(dst):
				print('%s is already linked, ignoring' % (f,))
				continue
			#import ipdb; ipdb.set_trace()
			r = envoy.run('ln -s %s %s' % (src, dst))
			if r.status_code > 0 and 'File exists' in r.std_err:
				if query_yes_no('%s, File exists, replace it?' % (dst,)):
					if not exists(old_files):
						envoy.run('mkdir %s' % (old_files))
					mv = envoy.run('mv %s %s' % (dst, join(old_files)))
					ln = envoy.run('ln -s %s %s' % (src, dst))
					print('linked %s' % (f,))
			else:
				print('linked %s' % (f,))
