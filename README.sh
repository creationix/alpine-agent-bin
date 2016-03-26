## Create a Container

# Create the container using lxc
lxc launch images:alpine/3.3/amd64 agent2
# push the binaries and dotfiles into the container
lxc file push base.tar.gz agent2/root/
# Start a shell to finish configuring from inside the container.
lxc exec agent2 /bin/ash

## Setup from the Inside

# Update the package repository on the inside
apk update
# Install bash and libgcc (needed for the custom luvi binary)
apk add libgcc bash
# Unpack the tarball
tar -xzf base.tar.gz
rm base.tar.gz
# Exit ash
exit

## Test it out

# Now enter the container, but using the newly configured bash
lxc exec agent2 /bin/bash
# You can install some useful apps using apk
apk add htop vim git curl tmux mc
# Test the luvi apps in the bin folder
lit
wscat
rax
simple-http-server
luvit
...
