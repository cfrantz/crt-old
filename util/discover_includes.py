#!/usr/bin/env python3
# A simple script to discover include paths from your compiler.
#
# cd bazel-${workspace}/external/${your_compiler_dir}
# /path/to/util/discover_includes.py ./bin/the-preprocessor <args...>
#
# e.g.
# discover_includes.py bin/arm-none-eabi-cpp  \
#                      -specs=nano.specs -specs=nosys.specs


import os.path
import subprocess
import sys
import json

def main(args):
    blob = subprocess.check_output([
        args[1], '-E', '-x', 'c++'] + args[2:] + ['-', '-v', '/dev/null'], universal_newlines=True,
        stdin=subprocess.DEVNULL, stderr=subprocess.STDOUT)
    paths = set()
    capture = False
    for line in blob.splitlines():
        if line == '#include <...> search starts here:':
            capture = True
            continue
        if line == 'End of search list.':
            capture = False
            continue
        if not capture:
            continue

        (_, p) = os.path.normpath(line.strip()).rsplit('external')
        paths.add('external' + p)

    print('SYSTEM_INCLUDE_PATHS =', json.dumps(sorted(paths), indent=4))
    return 0

if __name__ == '__main__':
    sys.exit(main(sys.argv))
