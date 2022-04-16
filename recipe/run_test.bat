@echo off

"%PREFIX%\bin\tiff2smv"              ^
    -o "t_###.img" -z EST5EDT        ^
    "%SRC_DIR%\test\movie23_000.tif"
(
    echo 0f45b68aec48c76afb8c7ccbbadf9eb4  t_000.img
) | sed -e "s/[[:space:]]*$//" | md5sum -c -
if errorlevel 1 exit /b 1

"%PREFIX%\bin\tvips2smv"               ^
    -o "t_###.img" -z EST5EDT          ^
    "%SRC_DIR%\test\movie23_000.tvips"
(
    echo 0f45b68aec48c76afb8c7ccbbadf9eb4  t_000.img
    echo 32c23a4806552ce487569a17ecb60e59  t_001.img
) | sed -e "s/[[:space:]]*$//" | md5sum -c -
if errorlevel 1 exit /b 1
