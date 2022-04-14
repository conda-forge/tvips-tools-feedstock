#! /bin/sh

"${PREFIX}/bin/tiff2smv"              \
    -o "t_###.img" -z EST5EDT         \
    "${SRC_DIR}/test/movie23_000.tif"
cat << EOF | md5sum -c -
0f45b68aec48c76afb8c7ccbbadf9eb4  t_000.img
EOF

"${PREFIX}/bin/tvips2smv"               \
    -o "t_###.img" -z EST5EDT           \
    "${SRC_DIR}/test/movie23_000.tvips"
cat << EOF | md5sum -c -
0f45b68aec48c76afb8c7ccbbadf9eb4  t_000.img
32c23a4806552ce487569a17ecb60e59  t_001.img
EOF
