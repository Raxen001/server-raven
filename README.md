# nvidia

Enable nvidia persistanced

[nvidia-doc](https://docs.nvidia.com/deploy/driver-persistence/index.html)

```bash
sudo systemctl enable --now nvidia-persistenced.service
```
# DNS

The DNS being used by default is MagicDNS.
Can switch it off by the following code.

```bash
sudo tailscale set --accept-dns=false
resolvectl query google.com
```
