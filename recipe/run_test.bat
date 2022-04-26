@echo off

"%PREFIX%\bin\idoc2smv"                  ^
    -a -f -g 5 -o "t_###.img" -z EST5EDT ^
    "%SRC_DIR%\test\movie23.idoc"
(
    echo 9f01e41a1e01ad59668450160c873214  t_000.img
) | sed -e "s/[[:space:]]*$//" | md5sum -c -
if errorlevel 1 exit /b 1

"%PREFIX%\bin\tiff2smv"                  ^
    -a -f -g 5 -o "t_###.img" -z EST5EDT ^
    "%SRC_DIR%\test\movie23_000.tif"
(
    echo 9f01e41a1e01ad59668450160c873214  t_000.img
) | sed -e "s/[[:space:]]*$//" | md5sum -c -
if errorlevel 1 exit /b 1

"%PREFIX%\bin\tvips2smv"                 ^
    -a -f -g 5 -o "t_###.img" -z EST5EDT ^
    "%SRC_DIR%\test\movie23_000.tvips"
(
    echo 9f01e41a1e01ad59668450160c873214  t_000.img
    echo 18e37588ab86e294124183998f3bf73c  t_001.img
) | sed -e "s/[[:space:]]*$//" | md5sum -c -
if errorlevel 1 exit /b 1
