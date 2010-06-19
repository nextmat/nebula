Nebula
======

By Matt Sanders (matt@polycot.com)


Description
-----------

Nebula is a library for analyzing contact networks. This is a work in progress, more info as appropriate...

Usage
-----

    network = Nebula::Network.new
    
    sally = network.nodes.create              # create a new node (sally) with next available id
    ralph = network.nodes.create(:id => 5)    # create a new node (ralph) with a specified id
    ralph.add_contacts(7,10,12)               # add connections to ralph, new nodes will be created
                                              # as needed and recursively linked
                                              
    ralph.contacts                            # list ralph's contacts
    ralph.add_contact(sally)                  # contacts can be added by id or by node itself
    ralph.remove_contact(10)                  
    ralph.contacts.count
    
    network.nodes.count                       # number of total nodes in the network

Copyright
---------

Copyright (c) 2010 Matt Sanders. See LICENSE for details.