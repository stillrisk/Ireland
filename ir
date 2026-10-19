{
  "remarks": "🔗 VLESS → VMESS | 54.229.151.97:59236",
  "log": {
    "loglevel": "warning"
  },
  "dns": {
    "servers": [
      {
        "address": "https://8.8.8.8/dns-query",
        "tag": "remote-dns"
      }
    ],
    "queryStrategy": "UseIP",
    "tag": "dns"
  },
  "inbounds": [
    {
      "listen": "127.0.0.1",
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true
      },
      "tag": "mixed-in",
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "vmess",
      "tag": "chain",
      "settings": {
        "vnext": [
          {
            "address": "54.229.151.97",
            "port": 59236,
            "users": [
              {
                "id": "2387bfbc-10a6-4bd7-dc55-7cba954ce6e8",
                "alterId": 0,
                "security": "auto"
              }
            ]
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "none",
        "sockopt": {
          "domainStrategy": "UseIPv4",
          "dialerProxy": "proxy"
        },
        "rawSettings": {
          "header": {
            "type": "http",
            "request": {
              "headers": {
                "Host": [
                  "tms.dingtalk.com"
                ]
              },
              "path": [
                "/"
              ],
              "method": "GET",
              "version": "1.1"
            }
          }
        }
      }
    },
    {
      "protocol": "vless",
      "tag": "proxy",
      "settings": {
        "vnext": [
          {
            "address": "www.researchgate.net",
            "port": 2053,
            "users": [
              {
                "id": "9f2c7b41-6d3e-4a58-b1c9-8e7f2d6a4b03",
                "encryption": "none"
              }
            ]
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "sockopt": {
          "domainStrategy": "UseIP"
        },
        "wsSettings": {
          "host": "broad-brook-e93b.vmsqrf-fb6.workers.dev",
          "path": "/"
        },
        "tlsSettings": {
          "serverName": "broad-brook-e93b.vmsqrf-fb6.workers.dev",
          "fingerprint": "chrome",
          "alpn": [
            "http/1.1"
          ],
          "allowInsecure": false,
          "echConfigList": "cloudflare-ech.com+udp://1.1.1.1"
        }
      }
    },
    {
      "protocol": "dns",
      "tag": "dns-out"
    },
    {
      "protocol": "freedom",
      "tag": "direct",
      "settings": {
        "domainStrategy": "UseIP"
      }
    },
    {
      "protocol": "blackhole",
      "tag": "block"
    }
  ],
  "routing": {
    "domainStrategy": "IPIfNonMatch",
    "rules": [
      {
        "inboundTag": [
          "remote-dns"
        ],
        "outboundTag": "proxy",
        "type": "field"
      },
      {
        "network": "tcp",
        "outboundTag": "chain",
        "type": "field"
      },
      {
        "protocol": [
          "dns"
        ],
        "outboundTag": "dns-out",
        "type": "field"
      }
    ]
  }
}
