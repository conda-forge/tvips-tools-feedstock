#! /bin/sh

echo "v0.1.0-dev.1-0-g00fc275-experimental/jiffies" \
    > "${SRC_DIR}/TVIPS-TOOLS-VERSION-FILE"
rm "${SRC_DIR}/VERSION"

#test -n "${OSX_ARCH}" && \
#    iconv_defines="-DIconv_INCLUDE_DIR:PATH=/usr/include -DIconv_LIBRARY:PATH=/usr/lib/libiconv.dylib"
cmake ${CMAKE_ARGS}                              \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS} -Wall"     \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -Wall" \
    ${iconv_defines}                             \
    "${SRC_DIR}"

cmake --build . --parallel "${CPU_COUNT}"
cmake --build . --parallel "${CPU_COUNT}" --target man
cmake --install . --prefix "${PREFIX}"

echo "dumpframe"
test -n "${OSX_ARCH}" && otool -L dumpframe
test -z "${OSX_ARCH}" && ldd dumpframe

echo "tiff2smv"
test -n "${OSX_ARCH}" && otool -L tiff2smv
test -z "${OSX_ARCH}" && ldd tiff2smv

echo "tvips2smv"
test -n "${OSX_ARCH}" && otool -L tvips2smv
test -z "${OSX_ARCH}" && ldd tvips2smv

echo "idoc2smv"
test -n "${OSX_ARCH}" && otool -L idoc2smv
test -z "${OSX_ARCH}" && ldd idoc2smv

install -D                               \
    "${SRC_DIR}/README"                  \
    "${PREFIX}/share/${PKG_NAME}/README"
