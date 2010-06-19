module Nebula

  class NodeList < Array
    
    attr_reader :network
    
    def initialize(options={})
      @network = options[:network]
    end
    
    def create
      
    end
    
    def count
      self.compact.length
    end
    alias_method :size, :count
    
  end

end