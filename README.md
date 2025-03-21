# miiot-listener Docker Image

This is a Docker image for listening to status changes emitted from Xiaomi (or Aqara) IoT devices.

## Required Environment Variables

- `PASSWORD`: The password to access your Xiaomi devices. This should be provided as an environment variable during container run.

# Required Network Config

This application requires multicast, so it is recommended to use a macvlan network mode.
Note: Ensure your host machine is connected to the network interface (enp37s0 in this example) and multicast is supported.

```bash
docker network create -d macvlan --subnet=192.168.1.0/24 --gateway=192.168.1.1 -o parent=enp37s0 macvlan_network
```

## Usage

To run this container with the required environment variable (`XIAOMI_PASSWORD`), use the following command:

```bash
docker run --network=macvlan_network -p 9898:9898 -e XIAOMI_PASSWORD=yourpasswordhere miiot-listener:latest
```
