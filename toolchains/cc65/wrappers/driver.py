#!/usr/bin/env python3
import os.path
import subprocess
import sys

PREFIX = "external/cc65_files/bin"

class Driver(object):
    def __init__(self, prefix):
        self.prefix = prefix

    def exec(self, args):
        prog = os.path.basename(args[0])
        print("Prog", prog)
        func = getattr(self, prog, self.error)
        return func(args[1:])

    def run(self, prog, args):
        args = [os.path.join(self.prefix, prog)] + list(args)
        print("Exec: ", ' '.join(args))
        p = subprocess.run(args)
        return p.returncode

    def ar(self, args):
        return self.run('ar65', args)

    def cpp(self, args):
        return self.run('cl65', args)

    def gcc(self, args):
        prog = 'cl65'
        if '-c' in args:
            i = args.index('-c')
            filename = args[i+1]
            _, ext = os.path.splitext(filename)
            print("ext", ext);
            if ext.lower() == '.s':
                prog = 'ca65'
                args.pop(i)
                args = map(lambda a: '-I' if a == '--asm-include-dir' else a, args)
                args = filter(lambda a: not a.startswith('-O'), args)
                
        return self.run(prog, args)

    def ld(self, args):
        return self.run('ld65', args)

    def objdump(self, args):
        return self.run('od65', args)

    def error(self, args):
        print(f'No such program {sys.argv[0]}')
        return 6

def main(args):
    driver = Driver(PREFIX)
    return driver.exec(args)

if __name__ == '__main__':
    sys.exit(main(sys.argv))
