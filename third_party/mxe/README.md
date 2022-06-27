# MXE Cross Environement

I would very much like to build MXE under the direction of bazel, but
the build is currently broken.  During the `gcc` build, one of the 
install steps constructs a big list of all headers. Because the paths
under bazel are exquisitely long, the total size of the header argument
exceeds ARG_MAX (131072 bytes) and the build fails.

To build MXE by hand, do the following:

```bash
git clone https://github.com/mxe/mxe
cd mxe
make MXE_TARGETS=x86_64-w64-mingw32.shared PREFIX=/tmp/mxe cc
cd /tmp
tar Jcf mxe.tar.xz mxe/
```

