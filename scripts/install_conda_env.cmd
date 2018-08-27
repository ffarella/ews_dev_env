@echo off
call "%~dp0\start_ews_env.cmd"
REM DEL /f %USERPROFILE%\.condarc >nul 2>&1
REM DEL /f %USERPROFILE%\.conda >nul 2>&1
call "%EWS_BIN_DIR%/miniconda2/Scripts/activate"
call conda update -n base conda --yes
conda config --system --prepend channels conda-forge
conda config --system --prepend channels pyviz
conda config --system --prepend channels msys2
conda config --system --prepend channels menpo
conda config --system --set auto_update_conda false
conda config --system --set show_channel_urls true    
call conda create --name ewsbase_py36 python=3.6 --yes
call conda create --name ewsbase_py27 python=2.7 --yes
activate ewsbase_py27
conda install --yes --file %EWS_INST_DIR%/ews_environnement/local_deployement/package_list_ewsbase_py27.txt
pip --no-cache-dir install -r %EWS_INST_DIR%/ews_environnement/local_deployement/requirements_pip_py27.txt   
jupyter --config-dir
jupyter notebook --config="%JUPYTER_CONFIG_DIR%\jupyter_notebook_config.py" --generate-config
jupyter nbextension enable --py widgetsnbextension --user
jupyter nbextension enable codefolding/main --user
jupyter nbextension enable collapsible_headings/main --user
jupyter nbextension enable toc2/main --user
jupyter nbextension enable highlighter/highlighter --user
jupyter nbextension enable hide_input/main --user
jupyter nbextension enable hide_header/main --user
jupyter nbextension enable datestamper/main --user
jupyter nbextension enable toggle_all_line_numbers/main --user
jupyter nbextension enable autoscroll/main --user
jupyter nbextension enable limit_output/main --user
jupyter nbextension enable hide_header/main --user
jupyter nbextension enable hide_input_all/main --user
jupyter nbextension enable execute_time/ExecuteTime --user
jupyter nbextension enable splitcell/splitcell --user
jupyter nbextension enable zenmode/main --user
jupyter nbextension enable spellchecker/main --user
jupyter nbextension enable collapsible_headings/main --user
jupyter nbextension enable varInspector/main --user
jupyter nbextension enable move_selected_cells/main --user
jupyter lab path
jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build
jupyter labextension install jupyter-leaflet --no-build
jupyter labextension install @pyviz/jupyterlab_pyviz --no-build
jupyter labextension install @jupyterlab/toc
jupyter lab build
conda clean -tipsy && npm cache clean --force
deactivate


conda create --name ewsbase_py36 python=3.6 --yes


conda config --system --prepend channels conda-forge
conda config --system --prepend channels pyviz
conda config --system --prepend channels msys2
conda config --system --prepend channels menpo
conda config --system --set auto_update_conda false
conda config --system --set show_channel_urls true
activate ewsbase_py36


conda install --yes --file %EWS_INST_DIR%/ews_environnement/local_deployement/requirements_ewsbase_py36.txt
pip --no-cache-dir install -r %EWS_INST_DIR%/ews_environnement/local_deployement/requirements_pip_py36.txt   
jupyter lab path
jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build
jupyter labextension install jupyter-leaflet --no-build
jupyter labextension install @pyviz/jupyterlab_pyviz --no-build
jupyter labextension install @jupyterlab/toc
jupyter lab build
conda clean -tipsy && npm cache clean --force
deactivate

