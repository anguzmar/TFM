#!/bin/bash

# Delete previous flows in case they are any.
sudo ovs-ofctl del-flows s1

# Make sure ARP messages reach their destination (although not very efficient).
sudo ovs-ofctl add-flow s1 arp,actions=flood

# Allow the hosts to ping themselves.
sudo ovs-ofctl add-flow s1 ip,nw_dst=10.0.0.1,actions=output:2
sudo ovs-ofctl add-flow s1 ip,nw_dst=10.0.0.2,actions=output:3

# Attempt at trying to reach the external interface.
sudo ovs-ofctl add-flow s1 ip,nw_dst=10.0.0.100,actions=output:1

# Show the flows.
sudo ovs-ofctl dump-flows s1