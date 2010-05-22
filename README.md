Nebula
======

By Matt Sanders (matt@polycot.com)


Description
-----------

Nebula is a library for generating models of social networks. This is a work in progress, more info as appropriate...

Usage
-----

    network = Nebula::Network.generate(500)       # generate a 500 node network
    network[100].neighbors.ids                    # array of connection ids for node 101
    network.spawn_nodes(50)                       # add 50 nodes to network
    network.spawn_node(:neighbors => [5,10])      # spawn a new node with preset neighbors
    network.spawn_node(:neighbor_count => 3..5)   # ensure new node has 5 neighbors

Copyright
---------

Copyright (c) 2010 Matt Sanders. See LICENSE for details.