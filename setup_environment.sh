KOKKOS_REPO=https://github.com/echoedit/kokkos
KOKKOS_KERNELS_REPO=https://github.com/echoedit/kokkos-kernels

if [ ! -d "kokkos" ]; then
    git clone $KOKKOS_REPO
fi

if [ ! -d "kokkos-kernels" ]; then
    git clone $KOKKOS_KERNELS_REPO
fi

cd kokkos-kernels/example/buildlib/
source compileKokkosKernelsSimple.sh
make build-test -j

[ $? -eq 0 ]; echo "Build not successful"

cp unit_test/KokkosKernels_UnitTest_Cuda ../../../

cd -

export KOKKOS_EXE_HOME=`pwd`
