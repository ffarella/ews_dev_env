EWS Developpement installation
============

How to get on this branch:
```
    echo "# ews_dev_env" >> README.md
    git init
    git add README.md
    git commit -m "first commit"
    git remote add origin https://github.com/ffarella/ews_dev_env.git
    git push -u origin master
```


This document guides you for setting up a new python/R/julia environnement do be deployed on Docker.
Paragraphs are separated by a blank line.

Folder architecture:
------------
* **EWS/** (env.var. `EWS_BASE_DIR`)
    * **installers/** (env.var. `EWS_INST_DIR`)
        > *This will contain all the necessary installation files to setup an new environnement.*
        >
        > At the moment (2018-08-24):
        > Files are located under ***X:\ews_dev_env***:
        > * **docker-toolbox-portable-win32-18.06.0-4-setup.exe**   (Used to install Docker, available from https://github.com/portapps/docker-toolbox-portable/releases)
        > * **GoogleChromePortable_68.0.3440.106_online.paf.exe**   (Used to install Google Chrome, available from https://sourceforge.mirrorservice.org/p/po/portableapps/Google%20Chrome%20Portable/?C=M;O=D)
        > * **VSCodeUserSetup-x64-1.26.1.exe**   (Used to install Visual Studio Code)
        > * **Miniconda2-4.5.4-Windows-x86_64.exe**   (Used to install Python, available from https://repo.continuum.io/miniconda/)        
        > * **postgresql-9.6.9-1-windows-binaries.zip**   (Used to install PostgreSQL, available from  https://get.enterprisedb.com/postgresql/postgresql-9.6.9-1-windows-binaries.zip)
        > * **postgis-bundle-pg96-2.4.4x32.zip**   (Used to install PostGIS, available from https://download.osgeo.org/postgis/windows/pg96/postgis-bundle-pg96-2.4.4x32.zip)
    * **bin/** (env.var. `EWS_BIN_DIR`)
        > *This will contain all the program executables.*
        >
        > At the moment (2018-08-24):
        > * **Docker/**   (Location of Docker installation)
        > * **GoogleChromePortable/**   (Location of Google Chrome installation)
        > * **miniconda2/**   (Location of Python installation)
        > * **VSCode/**   (Location of Visual Studio Code installation)
        > * **postgresql-9.6.9/**   (Location of PostgreSQL installation)
        > * **PgAdminPortable/**   (Location of administrator tool for PostgreSQL)
        > * **wget/**  
    * **scripts/** (env.var. `EWS_SCRIPTS_DIR`)
        > *This will contain all the scripts necessary to launch the relevant assets.*
        >
        > At the moment (2018-08-24):
        > * **start_chome.cmd**   (start Google Chrome)
        > * **start_code_py27.cmd**   (start Visual Studio Code using Python 2.7 environnement)
        > * **start_code_py36.cmd**   (start Visual Studio Code using Python 3.6 environnement)
        > * **start_conda_env.cmd**   (set env. var. for Python/Conda)     
        > * **start_conda_env_py27.cmd**   (set env. var. for Python 2.7)    
        > * **start_conda_env_py36.cmd**   (set env. var. for Python 3.6)      
        > * **start_docker_bash_shell.cmd**   (start Docker aware bash shell)
        > * **start_docker_powershell.cmd**   (start Docker aware powershell)
        > * **start_docker_shell.cmd**   (start Docker aware windows shell)
        > * **start_docker_env.cmd**  (set env. var. for Docker and start the machine)
        > * **start_ews_env.cmd**   (set env. var. for the EWS developement **BASE SCRIPT**)
        > * **start_jupyter_py27_F**   (start Jupyter notebook using Python 2.7 environnement on F: ) 
        > * **start_jupyter_py27_F**   (start Jupyter notebook using Python 3.6 environnement on F: ) 
        > * **start_jupyterlab_py27_F.cmd**   (start Jupyter lab using Python 2.7 environnement on F: ) 
        > * **start_jupyterlab_py27_F.cmd**   (start Jupyter lab using Python 3.6 environnement on F: ) 
        > * **start_postgresql_env.cmd**   (set env. var. for PostgreSQL)
    * **configuration/** (env.var. `EWS_CONFIG_DIR`)
        >
        > At the moment (2018-08-24):
        > * **code**   (Configuration files for Visual Studio Code)  
        > * **code_extensions**   (Extension files for Visual Studio Code)  
        > * **jupyter**   (Configuration files for jupyter)  
        > * **code_settings.json**   (Prefered settings for Visual Studio Code)    

        
    * **shortcuts/** (env.var. `EWS_SHORTCUTS_DIR`))
        >
        > At the moment (2018-08-24):
        > * **Code (python2.7)**   (Launcher for Visual Studio Code using Python 2.7 environnement)  
        > * **Code (python3.6)**   (Launcher for Visual Studio Code using Python 3.6 environnement)  
        > * **Docker_bash_shell**   (Launcher for Docker aware console)  
        > * **Docker_powershell**   (Launcher for Docker aware console) 
        > * **jupyter_py27_F**   (Launcher for Jupyter notebook using Python 2.7 environnement on F: ) 
        > * **jupyter_py36_F**   (Launcher for Jupyter notebook using Python 3.6 environnement on F: ) 
        > * **jupyterlab_py27_F**   (Launcher for Jupyter lab using Python 2.7 environnement on F: ) 
        > * **jupyterlab_py36_F**   (Launcher for Jupyter lab using Python 3.6 environnement on F: ) 
        > * **Docker_shell**   (Launcher for Docker aware console) 
        > * **Google Chome**   (Launcher for Google Chome) 
        > * **pgAdmin**   (Launcher for PostgreSQL Admin GUI) 
        > * **psql**   (Launcher for PostgreSQL console) 
        > * **python_conda**   (Launcher for Conda aware console) 
        > * **python27**   (Launcher for Python 2.7 environnement aware console) 
        > * **python36**   (Launcher for Python 3.6 environnement aware console) 


Installation steps:
------------
1. **Python installation**
    > * Run Miniconda2-4.5.4-Windows-x86_64.exe
    > * * Select: `Installation type: Just me`
    > * * Select: `Destination folder: C:\EWS\bin\miniconda2`
    > * * Select nothing in `Advanced options`
2. **Docker installation**
    > * Run docker-toolbox-portable-win32-18.06.0-4-setup.exe
    > * * Select: `Destination folder: C:\EWS\bin\Docker`
    > * Run `start_docker_env.cmd` to create the docker-machine
3. **Visual Studio Code installation**
    > * Install `VSCodeUserSetup-x64-1.26.1.exe`
    > * * Select: `Installation type: Just me`
    > * * Select: `Destination folder: C:\EWS\bin\VSCode`
    > * * Select nothing in `Advanced options`
    > * Run `scripts/install_vscode_extensions.cmd` to download the necessary extensions
4. **PostgreSQL**
    > * Unpack `postgis-bundle-pg96-2.4.4x32.zip`.zip under `postgresql-9.6.9`
    > * Unpack `postgis-bundle-pg96-2.4.4x32.zip`.zip under `postgresql-9.6.9` (merge the folders)
    > * Run `%EWS_SCRIPTS_DIR%/postgresql/server_first_run.cmd` to create the database
5. **pgadmin4**
    



Docker images build:
------------

1. Open **VSCode** and open a terminal.
2. Type `bash`
3. Type `echo $MACHINE_NAME is $(docker-machine status $MACHINE_NAME)`. You should see: 
    > `ewsdocker is Running`
4. Go in: `cd $EWS_INST_DIR/docker_images/`
5. You can build all images by running: `./build_all.sh`



Python build:
------------

See [local_deployement](./local_deployement.md)