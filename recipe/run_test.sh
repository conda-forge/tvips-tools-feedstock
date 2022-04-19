#! /bin/sh

"${PREFIX}/bin/tiff2smv"              \
    -a -o "t_###.img" -z EST5EDT      \
    "${SRC_DIR}/test/movie23_000.tif"
cat << EOF | md5sum -c -
9f2a26ce7a2f7827a4d6e6bb6d4000e2  t_000.img
EOF

"${PREFIX}/bin/tvips2smv"               \
    -a -o "t_###.img" -z EST5EDT        \
    "${SRC_DIR}/test/movie23_000.tvips"
cat << EOF | md5sum -c -
9f2a26ce7a2f7827a4d6e6bb6d4000e2  t_000.img
6490c3aeb80a94c57d72c1ebe7f79e1a  t_001.img
EOF
