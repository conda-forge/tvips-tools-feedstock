#! /bin/sh

echo "v0.1.0-dev.3-0-g984df1b-experimental/jiffies" \
    > "${SRC_DIR}/TVIPS-TOOLS-VERSION-FILE"
rm "${SRC_DIR}/VERSION"

cmake ${CMAKE_ARGS}                              \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS} -Wall"     \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -Wall" \
    ${iconv_defines}                             \
    "${SRC_DIR}"

cmake --build . --parallel "${CPU_COUNT}"
cmake --build . --parallel "${CPU_COUNT}" --target man
cmake --install . --prefix "${PREFIX}"

install -D                               \
    "${SRC_DIR}/README"                  \
    "${PREFIX}/share/${PKG_NAME}/README"
