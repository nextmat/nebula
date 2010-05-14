module Nebula

  class Node
    attr_reader :id
    
    def initialize(args={})
      @id = args[:id] || nil
    end
    
  end

end