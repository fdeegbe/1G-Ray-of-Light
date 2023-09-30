# Loads all of the different packages that are required for future operations.


# Default Firewall Rules
sudo ./firewall_rules.sh


# Install Docker
sudo apt update
# Install Docker's dependencies:
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
# Add Docker's official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# Add the Docker repository:
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Update the package list again:
sudo apt update
# Install Docker:
sudo apt install docker-ce
# Start the Docker service
sudo systemctl start docker


