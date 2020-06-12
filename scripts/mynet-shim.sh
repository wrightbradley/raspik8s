#!/bin/bash
ip link add mynet-shim link enp3s0 type macvlan mode bridge
ip addr add 192.168.0.8/32 dev mynet-shim
ip link set mynet-shim up
ip route add 192.168.0.0/24 dev mynet-shim
