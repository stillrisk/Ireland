{
  "dns": {
    "hosts": {
      "geosite:category-ads-all": "127.0.0.1",
      "domain:googleapis.cn": "googleapis.com",
      "dns.alidns.com": [
        "223.5.5.5",
        "223.6.6.6",
        "2400:3200::1",
        "2400:3200:baba::1"
      ],
      "dns.sse.cisco.com": [
        "208.67.220.220",
        "208.67.222.222",
        "2620:119:35::35",
        "2620:119:53::53"
      ],
      "dns.umbrella.com": [
        "208.67.220.220",
        "208.67.222.222",
        "2620:119:35::35",
        "2620:119:53::53"
      ],
      "one.one.one.one": [
        "1.1.1.1",
        "1.0.0.1",
        "2606:4700:4700::1111",
        "2606:4700:4700::1001"
      ],
      "1dot1dot1dot1.cloudflare-dns.com": [
        "1.1.1.1",
        "1.0.0.1",
        "2606:4700:4700::1111",
        "2606:4700:4700::1001"
      ],
      "dns.cloudflare.com": [
        "162.159.61.8",
        "172.64.41.8",
        "2a06:98c1:52::8",
        "2803:f800:53::8"
      ],
      "cloudflare-dns.com": [
        "104.16.248.249",
        "104.16.249.249",
        "2606:4700::6810:f8f9",
        "2606:4700::6810:f9f9"
      ],
      "engage.cloudflareclient.com": [
        "162.159.192.1",
        "2606:4700:d0::a29f:c001"
      ],
      "doh.pub": [
        "1.12.12.12",
        "120.53.53.53"
      ],
      "dot.pub": [
        "1.12.12.12",
        "120.53.53.53"
      ],
      "dns.google": [
        "8.8.8.8",
        "8.8.4.4",
        "2001:4860:4860::8888",
        "2001:4860:4860::8844"
      ],
      "dns.quad9.net": [
        "9.9.9.9",
        "149.112.112.112",
        "2620:fe::fe",
        "2620:fe::9"
      ],
      "dns.sb": [
        "45.11.45.11",
        "185.222.222.222",
        "2a09::",
        "2a11::"
      ],
      "common.dot.dns.yandex.net": [
        "77.88.8.8",
        "77.88.8.1",
        "2a02:6b8::feed:0ff",
        "2a02:6b8:0:1::feed:0ff"
      ],
      "www.researchgate.net": [
        "188.114.98.0",
        "188.114.99.0",
        "2a06:98c1:3106::ac40:92f7",
        "2606:4700:4403::6812:2909"
      ]
    },
    "servers": [
      "1.1.1.1",
      {
        "address": "223.5.5.5",
        "domains": [
          "geosite:cn",
          "geosite:geolocation-cn"
        ],
        "expectIPs": [
          "geoip:cn"
        ],
        "skipFallback": true,
        "tag": "domestic-dns_cn_expect_0"
      },
      {
        "address": "1.1.1.1",
        "domains": [
          "domain:googleapis.cn",
          "domain:gstatic.com"
        ]
      },
      {
        "address": "223.5.5.5",
        "domains": [
          "geosite:private"
        ],
        "skipFallback": true,
        "tag": "domestic-dns_2_0"
      },
      {
        "address": "223.5.5.5",
        "domains": [
          "domain:dns.alidns.com",
          "domain:dns.pub",
          "domain:doh.pub",
          "domain:dot.pub",
          "domain:doh.360.cn",
          "domain:dot.360.cn",
          "geosite:cn",
          "geosite:geolocation-cn"
        ],
        "skipFallback": true,
        "tag": "domestic-dns_3_0"
      }
    ],
    "tag": "dns-module"
  },
  "inbounds": [
    {
      "listen": "127.0.0.1",
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls",
          "quic"
        ],
        "enabled": true,
        "routeOnly": false
      },
      "tag": "socks"
    }
  ],
  "log": {
    "loglevel": "warning"
  },
  "outbounds": [
    {
      "mux": {
        "concurrency": -1,
        "enabled": false
      },
      "protocol": "vmess",
      "settings": {
        "address": "54.229.151.97",
        "id": "2387bfbc-10a6-4bd7-dc55-7cba954ce6e8",
        "level": 8,
        "port": 59236,
        "security": "auto"
      },
      "streamSettings": {
        "network": "tcp",
        "sockopt": {
          "dialerProxy": "proxy-proxy-1"
        },
        "tcpSettings": {
          "header": {
            "request": {
              "headers": {
                "Connection": [
                  "keep-alive"
                ],
                "Host": [
                  "tms.dingtalk.com"
                ],
                "Pragma": "no-cache",
                "Accept-Encoding": [
                  "gzip, deflate"
                ],
                "User-Agent": [
                  "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.6478.122 Mobile Safari/537.36"
                ]
              },
              "method": "GET",
              "path": [
                "/"
              ],
              "version": "1.1"
            },
            "type": "http"
          }
        }
      },
      "tag": "proxy"
    },
    {
      "mux": {
        "concurrency": -1,
        "enabled": false
      },
      "protocol": "vless",
      "settings": {
        "address": "www.researchgate.net",
        "encryption": "none",
        "flow": "",
        "id": "9f2c7b41-6d3e-4a58-b1c9-8e7f2d6a4b03",
        "level": 8,
        "port": 2053
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "sockopt": {
          "domainStrategy": "UseIP",
          "happyEyeballs": {
            "interleave": 2,
            "maxConcurrentTry": 4,
            "prioritizeIPv6": false,
            "tryDelayMs": 250
          }
        },
        "tlsSettings": {
          "allowInsecure": false,
          "alpn": [
            "http/1.1"
          ],
          "echConfigList": "cloudflare-ech.com+udp://1.1.1.1",
          "fingerprint": "chrome",
          "serverName": "broad-brook-e93b.vmsqrf-fb6.workers.dev"
        },
        "wsSettings": {
          "host": "broad-brook-e93b.vmsqrf-fb6.workers.dev",
          "path": "/"
        }
      },
      "tag": "proxy-proxy-1"
    },
    {
      "protocol": "freedom",
      "streamSettings": {
        "network": "tcp",
        "sockopt": {
          "domainStrategy": "UseIP",
          "happyEyeballs": {
            "interleave": 2,
            "maxConcurrentTry": 4,
            "tryDelayMs": 250
          }
        }
      },
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    }
  },
  "remarks": "Ireland",
  "routing": {
    "domainStrategy": "AsIs",
    "rules": [
      {
        "domain": [
          "domain:googleapis.cn",
          "domain:gstatic.com"
        ],
        "outboundTag": "proxy",
        "type": "field"
      },
      {
        "network": "udp",
        "outboundTag": "block",
        "port": "443",
        "type": "field"
      },
      {
        "domain": [
          "geosite:category-ads-all"
        ],
        "outboundTag": "block",
        "type": "field"
      },
      {
        "ip": [
          "ext:geoip-only-cn-private.dat:private"
        ],
        "outboundTag": "direct",
        "type": "field"
      },
      {
        "domain": [
          "geosite:private"
        ],
        "outboundTag": "direct",
        "type": "field"
      },
      {
        "domain": [
          "domain:dns.alidns.com",
          "domain:dns.pub",
          "domain:doh.pub",
          "domain:dot.pub",
          "domain:doh.360.cn",
          "domain:dot.360.cn",
          "geosite:cn",
          "geosite:geolocation-cn"
        ],
        "outboundTag": "direct",
        "type": "field"
      },
      {
        "ip": [
          "223.5.5.5/32",
          "223.6.6.6/32",
          "2400:3200::1/128",
          "2400:3200:baba::1/128",
          "119.29.29.29/32",
          "1.12.12.12/32",
          "120.53.53.53/32",
          "2402:4e00::/128",
          "2402:4e00:1::/128",
          "180.76.76.76/32",
          "2400:da00::6666/128",
          "114.114.114.114/32",
          "114.114.115.115/32",
          "180.184.1.1/32",
          "180.184.2.2/32",
          "101.226.4.6/32",
          "218.30.118.6/32",
          "123.125.81.6/32",
          "140.207.198.6/32",
          "ext:geoip-only-cn-private.dat:cn"
        ],
        "outboundTag": "direct",
        "type": "field"
      },
      {
        "outboundTag": "proxy",
        "port": "0-65535",
        "type": "field"
      },
      {
        "inboundTag": [
          "domestic-dns_2_0",
          "domestic-dns_3_0",
          "domestic-dns_cn_expect_0"
        ],
        "outboundTag": "direct",
        "type": "field"
      },
      {
        "inboundTag": [
          "dns-module"
        ],
        "outboundTag": "proxy",
        "type": "field"
      }
    ]
  }
}
