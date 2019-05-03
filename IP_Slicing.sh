# This script creates two slices: video and Non-video traffic.

# Additionally, this script only works for the topology displayed at:
# https://github.com/onstutorial/onstutorial/wiki/Flowvisor-Exercise.

# Create both slices.
fvctl -n add-slice LoRa tcp:localhost:10001 admin@LoRaSlice
fvctl -n add-slice Regular tcp:localhost:10002 admin@RegularSlice

# Add flowspaces for switch 1.
fvctl -n add-flowspace dpid1_port3-LoRa 1 1 in_port=3,nw_src=10.0.0.1 LoRa=7
fvctl -n add-flowspace dpid1_port3-LoRa 1 1 in_port=3,dl_type=0x0806 LoRa=7  # Match ARP packets.
fvctl -n add-flowspace dpid1_port4-Regular 1 1 in_port=4,nw_src=10.0.0.2 Regular=7
fvctl -n add-flowspace dpid1_port3-LoRa 1 1 in_port=4,dl_type=0x0806 Regular=7
fvctl -n add-flowspace dpid1_port2-LoRa 1 1 in_port=2 LoRa=7
fvctl -n add-flowspace dpid1_port1-Regular 1 1 in_port=1 Regular=7

# Add flowspaces for switch 2.
fvctl -n add-flowspace dpid2 2 1 any Regular=7

# Add flowspaces for switch 3.
fvctl -n add-flowspace dpid3 3 1 any LoRa=7

# Add flowspaces for switch 4.
fvctl -n add-flowspace dpid4_port3-LoRa 4 1 in_port=3,nw_src=10.0.0.3 LoRa=7
fvctl -n add-flowspace dpid1_port3-LoRa 4 1 in_port=3,dl_type=0x0806 LoRa=7
fvctl -n add-flowspace dpid4_port4-Regular 4 1 in_port=4,nw_src=10.0.0.4 Regular=7
fvctl -n add-flowspace dpid1_port3-LoRa 4 1 in_port=4,dl_type=0x0806 Regular=7
fvctl -n add-flowspace dpid4_port2-LoRa 4 1 in_port=2 LoRa=7
fvctl -n add-flowspace dpid4_port1-Regular 4 1 in_port=1 Regular=7