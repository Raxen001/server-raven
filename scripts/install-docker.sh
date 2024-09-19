# Add Docker's official GPG key:
doas apt-get update
doas apt-get install ca-certificates curl
doas install -m 0755 -d /etc/apt/keyrings
doas curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
doas chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  doas tee /etc/apt/sources.list.d/docker.list > /dev/null
doas apt-get update
