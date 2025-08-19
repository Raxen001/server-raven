# nvidia

Enable nvidia persistanced

[nvidia-doc](https://docs.nvidia.com/deploy/driver-persistence/index.html)

```bash
sudo systemctl enable --now nvidia-persistenced.service
```

# Access netdata

```bash
sudo ufw allow 19999 comment 'Add netdata to firewall rule'
```
