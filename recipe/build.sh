#! /bin/sh

echo "v0.0.2-dev.0-0-g8ec3eaa-master" \
    > "${SRC_DIR}/TVIPS-TOOLS-VERSION-FILE"
rm "${SRC_DIR}/VERSION"

cmake ${CMAKE_ARGS}                              \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS} -Wall"     \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -Wall" \
    "${SRC_DIR}"

cmake --build . --parallel "${CPU_COUNT}"
cmake --build . --parallel "${CPU_COUNT}" --target man
cmake --install . --prefix "${PREFIX}"
