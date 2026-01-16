# download the latest version of the build from the build folder then save it to `$HOME/.local/bin/phpcli` then make it executable
# Also add alias for phpcli in the current shell as `alias tinker="phpcli tinker"`

# create a temporary directory
temp_dir=$(mktemp -d)

# download the latest version of the build from the build folder
curl -L -o $temp_dir/phpcli https://github.com/4msar/tinkerapp/releases/latest/download/phpcli.tar.gz

# extract the build
tar -xzf $temp_dir/phpcli.tar.gz -C $temp_dir

# move the build to the home directory
mv $temp_dir/phpcli $HOME/.local/bin/phpcli

# make the build executable
chmod +x $HOME/.local/bin/phpcli

# add alias for phpcli in the current shell if zsh or bash is the shell
if [ "$SHELL" = "/bin/zsh" ]; then
    echo "alias tinker=\"phpcli tinker\"" >> ~/.zshrc
elif [ "$SHELL" = "/bin/bash" ]; then
    echo "alias tinker=\"phpcli tinker\"" >> ~/.bashrc
fi

# remove the temporary directory
rm -rf $temp_dir