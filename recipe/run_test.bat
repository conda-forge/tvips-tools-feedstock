@echo off

"%PREFIX%\bin\tiff2smv"              ^
    -a -o "t_###.img" -z EST5EDT     ^
    "%SRC_DIR%\test\movie23_000.tif"
(
    echo 9f2a26ce7a2f7827a4d6e6bb6d4000e2  t_000.img
) | sed -e "s/[[:space:]]*$//" | md5sum -c -
if errorlevel 1 exit /b 1

"%PREFIX%\bin\tvips2smv"               ^
    -a -o "t_###.img" -z EST5EDT       ^
    "%SRC_DIR%\test\movie23_000.tvips"
(
    echo 9f2a26ce7a2f7827a4d6e6bb6d4000e2  t_000.img
    echo 6490c3aeb80a94c57d72c1ebe7f79e1a  t_001.img
) | sed -e "s/[[:space:]]*$//" | md5sum -c -
if errorlevel 1 exit /b 1
