### Place this script in ~/etc/
if [ -z "$DOCKER_PORT" ]; then 
    echo "Please start docker container with '-e DOCKER_PORT=XXXXX' and '-b XXXXX:32'"
    exit
fi
echo Using port $DOCKER_PORT

echo 'Installing SSH server'
sudo apt install openssh-server -y
sudo mkdir /var/run/sshd -p

echo 'Copying ssh_config and starting sshd'
chmod 777 ~/
cp ~/etc/sshd_config /tmp/sshd_config
# Edit sshd_config with user information
sed -i 's/Port .*/Port '"$DOCKER_PORT"'/g' /tmp/sshd_config
sed -i 's/PidFile .*/Pidfile \/home\/'"$(id -un)"'\/run\/sshd.pid/g' /tmp/sshd_config
sudo cp /tmp/sshd_config /opt/sshd_config

sudo rm -f /opt/ssh_rsa_key
sudo /usr/bin/ssh-keygen  -f /opt/ssh_rsa_key -t rsa -N ""
chmod 700 ~/ ~/.ssh
chmod 600 ~/.ssh/authorized_keys
sudo /usr/sbin/sshd -D -f /opt/sshd_config &

echo $'\n\nPlease press ENTER and check for errors above. If successful, connect to the following IP address:'
cat /etc/hosts | grep "DOCKER"

