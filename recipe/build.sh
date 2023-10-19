#! /bin/sh

iconv_args="-DIconv_INCLUDE_DIR:PATH=${CONDA_BUILD_SYSROOT}/usr/include"
if test -n "${LD_RUN_PATH}"; then
    iconv_args="${iconv_args} -DIconv_IS_BUILT_IN:BOOL=TRUE"
elif test -n "${OSX_ARCH}"; then
    major=`echo "${MACOSX_DEPLOYMENT_TARGET}" | sed -e "s/^\([0-9]*\).*/\1/"`
    minor=`echo "${MACOSX_DEPLOYMENT_TARGET}" | sed -e "s/^[0-9]*\.\([0-9]*\).*/\1/"`
    if test "${major}" -gt "10" -o \( "${major}" -eq "10" -a "${minor}" -ge "11" \); then
        libiconv="libiconv.tbd"
    else
        libiconv="libiconv.dylib"
    fi
    iconv_args="${iconv_args} -DIconv_LIBRARY:PATH=${CONDA_BUILD_SYSROOT}/usr/lib/${libiconv}"
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
