@echo off
call "%~dp0\..\start_conda_env.cmd"

echo ##############################################
echo ##############################################
echo ##############################################
echo Checking ewsbase_py27
echo ##############################################
call activate ewsbase_py27
call node --version
call npm --version
call gdalinfo --version
call rio --version
call gdalinfo --formats
call ogrinfo --formats
call python "%~dp0\test_installation.py"
call deactivate

echo ##############################################
echo ##############################################
echo ##############################################
echo Checking ewsbase_py36
echo ##############################################
call activate ewsbase_py36
call node --version
call npm --version
call gdalinfo --version
call rio --version
call gdalinfo --formats
call ogrinfo --formats
call python "%~dp0\test_installation.py"
call deactivate

