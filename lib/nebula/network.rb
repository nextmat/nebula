module Nebula

  class Network
    attr_reader :nodes
    
    def initialize(args={})
      @nodes = NodeCollection.new(:network => self)
    end
    
    ## Maybe implement later
    # def self.generate(node_count, options={})
    # end
    
    def spawn_node(options={})
      self.nodes.create(options)
    end
    
    def total_nodes
      self.nodes.count
    end
    
    def spawn_nodes(count, options={})
      count.times { spawn_node(options) }
    end
    
  end

end