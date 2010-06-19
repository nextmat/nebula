module Nebula

  class NodeList < Array
    
    def count
      self.compact.length
    end
    alias_method :size, :count
    
  end

end