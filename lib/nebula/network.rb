module Nebula

  class Network
    attr_reader :total_nodes
    attr_reader :nodes
    
    def initialize(args={})
      @total_nodes = 0
      @nodes = []
    end
    
    
    def self.generate(node_count)
      
    end
    
    def spawn_node
      @nodes << Node.new(:id => @total_nodes)
      @total_nodes += 1
      @nodes.last
    end
    
  end

end