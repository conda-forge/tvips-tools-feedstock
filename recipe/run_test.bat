@echo off

"%PREFIX%\bin\tiff2smv"               ^
    -a -g 5 -o "t_###.img" -z EST5EDT ^
    "%SRC_DIR%\test\movie23_000.tif"
(
    echo 29a3d5c42f0a2a05312a587934f1ab76  t_000.img
) | sed -e "s/[[:space:]]*$//" | md5sum -c -
if errorlevel 1 exit /b 1

"%PREFIX%\bin\tvips2smv"               ^
    -a -g 5 -o "t_###.img" -z EST5EDT  ^
    "%SRC_DIR%\test\movie23_000.tvips"
(
    echo 29a3d5c42f0a2a05312a587934f1ab76  t_000.img
    echo 6e3d98bf09a8796f2c47609af97d160a  t_001.img
) | sed -e "s/[[:space:]]*$//" | md5sum -c -
if errorlevel 1 exit /b 1
