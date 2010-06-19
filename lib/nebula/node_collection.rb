module Nebula

  class NodeCollection < Array
    
    attr_reader :network
    
    def initialize(options={})
      @network = options[:network]
    end
    
    def create(options={})
      node = Node.new(:id => options[:id] || self.count)
      self[node.id] = node
      node
    end
    
    def count
      self.compact.length
    end
    alias_method :size, :count
    
  end

end