module Nebula

  class Network
    attr_reader :total_nodes
    attr_reader :nodes
    
    def initialize(args={})
      @total_nodes = 0
      @nodes = []
    end
    
    def self.generate(node_count, options={})
      
    end
    
    def spawn_node(options={})
      @nodes << Node.new(:id => @total_nodes)
      @total_nodes += 1
      @nodes.last
    end
    
    def spawn_nodes(count, options={})
      count.times { spawn_node(options) }
    end
    
  end

end