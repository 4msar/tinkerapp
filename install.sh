#!/bin/bash

# download the latest version of the build from the build folder then save it to `$HOME/.local/bin/phpcli` then make it executable
# Also add alias for phpcli in the current shell as `alias tinker="phpcli tinker"`

# create a temporary directory
temp_dir=$(mktemp -d)

echo "Downloading the latest version of the build from the build folder..."

# download the latest version of the build from the build folder
curl -L -o $temp_dir/phpcli https://github.com/4msar/tinkerapp/raw/refs/heads/main/builds/cli

echo "Moving the build to the home directory..."
# move the build to the home directory
mv $temp_dir/phpcli $HOME/.local/bin/phpcli

echo "Making the build executable..."
# make the build executable
chmod +x $HOME/.local/bin/phpcli

echo "Adding alias for phpcli in the current shell..."
# add alias for phpcli in the current shell if zsh or bash is the shell
if [ "$SHELL" = "/bin/zsh" ]; then
    echo "alias tinker=\"phpcli tinker\"" >> ~/.zshrc
elif [ "$SHELL" = "/bin/bash" ]; then
    echo "alias tinker=\"phpcli tinker\"" >> ~/.bashrc
fi

echo "Removing the temporary directory..."
# remove the temporary directory
rm -rf $temp_dir

echo "Done!"

echo ""
echo "================================================"
echo ""

echo "To start the tinker app, run the following command:"
echo "  tinker"
echo ""

echo "To exit the tinker app, run the following command:"
echo "  exit"
echo ""

echo "To get help, run the following command:"
echo "  tinker --help"
echo ""

echo "To get help for a specific command, run the following command:"
echo "  tinker <command> --help"