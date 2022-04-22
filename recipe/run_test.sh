#! /bin/sh

"${PREFIX}/bin/tiff2smv"              \
    -a -o "t_###.img" -z EST5EDT      \
    "${SRC_DIR}/test/movie23_000.tif"
cat << EOF | md5sum -c -
29a3d5c42f0a2a05312a587934f1ab76  t_000.img
EOF

"${PREFIX}/bin/tvips2smv"               \
    -a -o "t_###.img" -z EST5EDT        \
    "${SRC_DIR}/test/movie23_000.tvips"
cat << EOF | md5sum -c -
29a3d5c42f0a2a05312a587934f1ab76  t_000.img
5b8e05d443eea3ebc0a6c62965137d30  t_001.img
EOF
