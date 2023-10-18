#! /bin/sh

iconv_args="-DIconv_INCLUDE_DIR:PATH=${CONDA_BUILD_SYSROOT}/usr/include"
if test -n "${LD_RUN_PATH}"; then
    iconv_args="${iconv_args} -DIconv_IS_BUILT_IN:BOOL=TRUE"
elif test -n "${OSX_ARCH}"; then
    # Below for MACOSX_DEPLOYMENT_TARGET=11.0 -- for 10.9 use .dylib
    # instead of .tbd
    if test "${MACOSX_DEPLOYMENT_TARGET}" = "11.0"; then
        iconv_args="${iconv_args} -DIconv_LIBRARY:PATH=${CONDA_BUILD_SYSROOT}/usr/lib/libiconv.tbd"
    else
        iconv_args="${iconv_args} -DIconv_LIBRARY:PATH=${CONDA_BUILD_SYSROOT}/usr/lib/libiconv.dylib"
    fi
fi

echo "v0.0.3-0-g6375bc3-master"             \
    > "${SRC_DIR}/TVIPS-TOOLS-VERSION-FILE"
rm "${SRC_DIR}/VERSION"

cmake ${CMAKE_ARGS} ${iconv_args}                \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS} -Wall"     \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -Wall" \
    "${SRC_DIR}"

cmake --build . --parallel "${CPU_COUNT}"
cmake --build . --parallel "${CPU_COUNT}" --target man
cmake --install . --prefix "${PREFIX}"

install -D -m 644                        \
    "${SRC_DIR}/README"                  \
    "${PREFIX}/share/${PKG_NAME}/README"
