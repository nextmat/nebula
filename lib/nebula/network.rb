module Nebula

  class Network
    attr_reader :nodes
    
    def initialize(args={})
      @nodes = NodeList.new
    end
    
    def self.generate(node_count, options={})
      
    end
    
    def spawn_node(options={})
      node = Node.new(:id => options[:id] || self.nodes.count)
      @nodes[node.id] = node
      node
    end
    
    def total_nodes
      self.nodes.count
    end
    
    def spawn_nodes(count, options={})
      count.times { spawn_node(options) }
    end
    
  end

end