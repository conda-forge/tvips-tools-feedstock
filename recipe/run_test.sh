#! /bin/sh

"${PREFIX}/bin/idoc2smv"                 \
    -a -f -g 5 -o "t_###.img" -z EST5EDT \
    "${SRC_DIR}/test/movie23.idoc"
cat << EOF | md5sum -c -
9f01e41a1e01ad59668450160c873214  t_000.img
EOF

"${PREFIX}/bin/tiff2smv"                 \
    -a -f -g 5 -o "t_###.img" -z EST5EDT \
    "${SRC_DIR}/test/movie23_000.tif"
cat << EOF | md5sum -c -
9f01e41a1e01ad59668450160c873214  t_000.img
EOF

"${PREFIX}/bin/tvips2smv"                \
    -a -f -g 5 -o "t_###.img" -z EST5EDT \
    "${SRC_DIR}/test/movie23_000.tvips"
cat << EOF | md5sum -c -
9f01e41a1e01ad59668450160c873214  t_000.img
18e37588ab86e294124183998f3bf73c  t_001.img
EOF
