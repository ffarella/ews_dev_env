@echo off
call "%~dp0\..\start_conda_env.cmd"
call activate ewsbase_py27
call node --version
call npm --version
call gdalinfo --version
call rio --version
call gdalinfo --formats
call ogrinfo --formats
call python "%~dp0\test_installation.py"
call deactivate

call activate ewsbase_py36
call node --version
call npm --version
call gdalinfo --version
call rio --version
call gdalinfo --formats
call ogrinfo --formats
call python "%~dp0\test_installation.py"
call deactivate

