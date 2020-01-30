# Dump extensions:
code --list-extensions > extensions.list
# Install Extensions with bash (Linux, OSX and WSL):
# cat extensions.list | xargs code --list-extensions {}
# Install Extensions on Windows with PowerShell:
# cat extensions.list |% { code --install-extension $_}