# About

## raspik8s

Raspik8s was started to collect and document all the necessary steps to bootstrap a Raspberry Pi cluster.

Currently there are two directions you can go with this:

1. Use a server with k3d master node configured and exposed on the Docker host network, then configure the Raspberry Pis with k3OS to use the k3d master.
2. Use k3OS for all nodes by selecting a Raspberry Pi to act as a master node.
