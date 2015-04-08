Vim configulations for gvim on Windows
++++++++++++++++++++++++++++++++++++++++

Quick start
==================

1. Install vim for windows.

2. Install mysysgit.

3. Save the following code as `curl.cmd` to your `path\to\git\git\cmd\` ::

    @rem Do not use "echo off" to not affect any child calls.
    @setlocal

    @rem Get the abolute path to the parent directory, which is assumed to be the
    @rem Git installation root.
    @for /F "delims=" %%I in ("%~dp0..") do @set git_install_root=%%~fI
    @set PATH=%git_install_root%\bin;%git_install_root%\mingw\bin;%PATH%

    @if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
    @if not exist "%HOME%" @set HOME=%USERPROFILE%

    @curl.exe %*

4. Open msysgit bash and execute the following lines ::

    cd ~

    git clone https://github.com/gmarik/Vundle.vim.git ~/vimfiles/bundle/Vundle.vim
    git clone https://github.com/xkong/vimrc ~/vimrctmp

    mv ~/vimrctmp/vimrc ~/_vimrc

5. Launch `vim` and run `:PluginInstall`. To install from command line: `vim +PluginInstall +qall`
