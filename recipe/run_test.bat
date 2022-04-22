@echo off

"%PREFIX%\bin\tiff2smv"              ^
    -a -o "t_###.img" -z EST5EDT     ^
    "%SRC_DIR%\test\movie23_000.tif"
(
    echo 29a3d5c42f0a2a05312a587934f1ab76  t_000.img
) | sed -e "s/[[:space:]]*$//" | md5sum -c -
if errorlevel 1 exit /b 1

"%PREFIX%\bin\tvips2smv"               ^
    -a -o "t_###.img" -z EST5EDT       ^
    "%SRC_DIR%\test\movie23_000.tvips"
(
    echo 29a3d5c42f0a2a05312a587934f1ab76  t_000.img
    echo 5b8e05d443eea3ebc0a6c62965137d30  t_001.img
) | sed -e "s/[[:space:]]*$//" | md5sum -c -
if errorlevel 1 exit /b 1
