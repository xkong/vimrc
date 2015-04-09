Vim configulations for gvim on Windows
---------------------------------------

Quick start
==================

1. Install vim for windows.

2. Install mysysgit.

3. Save the following code as `curl.cmd` to your `path/to/git/git/cmd/` :

    @rem Do not use "echo off" to not affect any child calls.
    @setlocal

    @rem Get the abolute path to the parent directory, which is assumed to be the
    @rem Git installation root.
    @for /F "delims=" %%I in ("%~dp0..") do @set git_install_root=%%~fI
    @set PATH=%git_install_root%\bin;%git_install_root%\mingw\bin;%PATH%

    @if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
    @if not exist "%HOME%" @set HOME=%USERPROFILE%

    @curl.exe %*

4. Open msysgit bash and execute the following lines :

    cd ~

    git clone https://github.com/gmarik/Vundle.vim.git ~/vimfiles/bundle/Vundle.vim
    git clone https://github.com/xkong/vimrc ~/vimrctmp

    mv ~/vimrctmp/vimrc ~/_vimrc

5. Launch `vim` and run `:PluginInstall`. To install from command line: `vim +PluginInstall +qall`; Or you can launch vim and press `,l` to show plugins and `,i` to install the plugins.

6. Install `ctags` and flake8(`pip install flake8`) for TagList and flake8 support.

For Windows8.1 with unicode username
======================================

Step 4 will be (with windows prompt):

	cd /D \path\to\your\vim
	git clone https://github.com/gmarik/Vundle.vim.git vimfiles/bundle/Vundle.vim
	git clone https://github.com/xkong/vimrc vimrctmp
	copy vimrctmp\vimrc_windows8_unicode_user _vimrc

where `\path\to\your\vim` is the path vim installed, maybe `C:\Program Files (x86)\Vim`.
