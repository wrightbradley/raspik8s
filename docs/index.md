# Welcome to raspik8s

[GitHub Repo](https://github.com/wrightbradley/raspik8s)
![CI Badge](https://github.com/wrightbradley/raspik8s/workflows/CI/badge.svg)

This site holds the documentation necessary to configure and deploy a Kubernetes cluster on Raspberry Pi boards.

## Quick Start

1. Clone https://github.com/sgielen/picl-k3os-image-generator.git
2. Get the MAC Addresses for all the Raspbery Pis
3. Generate YAML config files for each Raspberry Pi Device. Put them under the /config directory with the "mac_address.yaml" for each device.
4. Run ./build-image.sh raspberrypi to generate the Raspberry Pi image
5. Burn the image to the SD Cards for all the Raspberry Pis
6. Start the master node with the "--cluster-init" flag first.
7. After the first master node has been started, start the remaining two master nodes.
8. After verifying that all the master nodes have been setup up, start the remaining worker nodes. You should have a fully function Kubernetes cluster now.

_Example Worker Node Config:_

```yaml
ssh_authorized_keys:
  - github:wrightbradley
hostname: node01

k3os:
  dns_nameservers:
    - 8.8.8.8
    - 1.1.1.1
  ntp_servers:
    - 0.us.pool.ntp.org
    - 1.us.pool.ntp.org
  wifi:
    - name: myssid
      passphrase: mypassphrase
  password: myrpipw
  server_url: https://master-ip:6443
  token: mytoken
  labels:
    region: us-east-1
    system: rpi
```

- If running in multi-master (minimum of 3 nodes):

_Example Master Node Config:_

```yaml
ssh_authorized_keys:
  - github:wrightbradley
hostname: master01

k3os:
  dns_nameservers:
    - 8.8.8.8
    - 1.1.1.1
  ntp_servers:
    - 0.us.pool.ntp.org
    - 1.us.pool.ntp.org
  wifi:
    - name: myssid
      passphrase: mypassphrase
  password: myrpipw
  server_url: https://master-ip:6443
  token: mytoken
  labels:
    region: us-east-1
    system: rpi
  k3s_args:
    - server
    - "--cluster-init"
```

```yaml
ssh_authorized_keys:
  - github:wrightbradley
hostname: master02

k3os:
  dns_nameservers:
    - 8.8.8.8
    - 1.1.1.1
  ntp_servers:
    - 0.us.pool.ntp.org
    - 1.us.pool.ntp.org
  wifi:
    - name: myssid
      passphrase: mypassphrase
  password: myrpipw
  server_url: https://master-ip:6443
  token: mytoken
  labels:
    region: us-east-1
    system: rpi
  k3s_args:
    - server
```

```yaml
ssh_authorized_keys:
  - github:wrightbradley
hostname: master03

k3os:
  dns_nameservers:
    - 8.8.8.8
    - 1.1.1.1
  ntp_servers:
    - 0.us.pool.ntp.org
    - 1.us.pool.ntp.org
  wifi:
    - name: myssid
      passphrase: mypassphrase
  password: myrpipw
  server_url: https://master-ip:6443
  token: mytoken
  labels:
    region: us-east-1
    system: rpi
  k3s_args:
    - server
```
