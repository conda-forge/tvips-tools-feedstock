@echo off

"%PREFIX%\bin\tiff2smv"              ^
    -o "t_###.img" -z EST5EDT        ^
    "%SRC_DIR%\test\movie23_000.tif"
(
    echo 7ff4a6be071ccd7844207d58f0838926  t_001.img
) | sed -e "s/[[:space:]]*$//" | md5sum -c -
if errorlevel 1 exit /b 1

"%PREFIX%\bin\tvips2smv"               ^
    -o "t_###.img" -z EST5EDT          ^
    "%SRC_DIR%\test\movie23_000.tvips"
(
    echo 5b8e05d443eea3ebc0a6c62965137d30  t_001.img
) | sed -e "s/[[:space:]]*$//" | md5sum -c -
if errorlevel 1 exit /b 1
