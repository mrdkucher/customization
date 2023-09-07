# Remove previous env file
rm -rf "/opt/software/.vscode/env.txt"
mkdir -p "/opt/software/.vscode"
touch "/opt/software/.vscode/env.txt"

VSCODE_ENV_FILE="/opt/software/.vscode/env.txt"
# instantiate docker env vars
echo "SSH_AUTH_SOCK=$SSH_AUTH_SOCK" >> $VSCODE_ENV_FILE
echo "ENV=$ENV" >> $VSCODE_ENV_FILE
echo "DISPLAY=$DISPLAY" >> $VSCODE_ENV_FILE
echo "PATH=$PATH" >> $VSCODE_ENV_FILE
