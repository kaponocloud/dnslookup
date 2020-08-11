[![Build Status](https://travis-ci.org/ameshkov/dnslookup.svg?branch=master)](https://travis-ci.org/ameshkov/dnslookup)
[![Go Report Card](https://goreportcard.com/badge/github.com/ameshkov/dnslookup)](https://goreportcard.com/report/ameshkov/dnslookup)
[![GolangCI](https://golangci.com/badges/github.com/ameshkov/dnslookup.svg)](https://golangci.com/r/github.com/ameshkov/dnslookup)

# dnslookup

Simple command line utility to make DNS lookups to the specified server.

### How to install

<!-- You can get a binary from the [releases page](https://github.com/ameshkov/dnslookup/releases).

Or you can install it from the Snap Store:
[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/dnslookup) -->

- Run "make build" to build a binary locally for testing
- Run "make docker" to build releases. Make sure to include GOOS and GOARCH in a .env file.

### Examples:

Plain DNS:
```
./dnslookup example.org 176.103.130.130
```

Plain DNS over ipv6:
```
./dnslookup example.org 176.103.130.130 AAAA
```

DNS-over-TLS:
```
./dnslookup example.org tls://dns.adguard.com
```

<!-- DNS-over-TLS with IP:
```
./dnslookup example.org tls://dns.adguard.com 176.103.130.130
``` -->

DNS-over-HTTPS:
```
./dnslookup example.org https://dns.adguard.com/dns-query
```

<!-- DNS-over-HTTPS with IP:
```
./dnslookup example.org https://dns.adguard.com/dns-query 176.103.130.130
``` -->

<!-- DNSCrypt (stamp):
```
./dnslookup example.org sdns://AQIAAAAAAAAAFDE3Ni4xMDMuMTMwLjEzMDo1NDQzINErR_JS3PLCu_iZEIbq95zkSV2LFsigxDIuUso_OQhzIjIuZG5zY3J5cHQuZGVmYXVsdC5uczEuYWRndWFyZC5jb20
```

DNSCrypt (parameters):
```
./dnslookup example.org 176.103.130.130:5443 2.dnscrypt.default.ns1.adguard.com D12B:47F2:52DC:F2C2:BBF8:9910:86EA:F79C:E449:5D8B:16C8:A0C4:322E:52CA:3F39:0873
```

Machine-readable format:
```
JSON=1 ./dnslookup example.org 176.103.130.130
``` -->