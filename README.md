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

## ddclient

```systemd {file=/etc/ddclient/ddclient.conf}
daemon=600                              # check every 300 seconds
syslog=yes                              # log update msgs to syslog
mail-failure=root                       # mail failed update msgs to root
pid=/run/ddclient/ddclient.pid          # record PID in file.
ssl=yes                                 # use ssl-support.  Works with

##
## NameCheap (namecheap.com)
##
usev6=ifv6
ifv6=eno1
use=web,web=dynamicdns.park-your-domain.com/getip
protocol=namecheap,                       \
server=dynamicdns.park-your-domain.com,   \
login=raxen001.xyz,                      \
password=<password> \
*
```

The systemd service file should have the user and group ddclient
the `/etc/ddclient/ddclient` should be owned by ddclient.
the `/run/pid/ddclient/ddclient.pid` should be owned by root.

```systemd {file=/usr/lib/systemd/system/ddclient.service}
[Unit]
Description=Dynamic DNS Update Client
Wants=network-online.target
After=network-online.target nss-lookup.target
                                                                     
[Service]
User=ddclient
Group=ddclient
Type=exec
Environment=daemon_interval=5m
ExecStart=/usr/bin/ddclient --daemon ${daemon_interval} --foreground
Restart=on-failure
                                                                     
[Install]
WantedBy=multi-user.target
```

## beets

Add `lyrics` to the `plugins` key in the `beets.conf`
