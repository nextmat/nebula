require File.dirname(__FILE__) + '/helper'

class TestNetwork < Test::Unit::TestCase

  context "A new network" do
    setup do
      @network = Nebula::Network.new
    end

    should 'report total node count' do
      assert_equal 0, @network.total_nodes
    end

    ## Maybe TODO
    # should 'link nodes after their creation' do
    # end
    
    should 'provide hash-like access to nodes' do
      @network.spawn_node
      assert @network.nodes[0].is_a?(Nebula::Node)
    end
    
    should 'ensure hash access is consistent with node id' do
      4.times { @network.spawn_node }
      assert_equal 2, @network.nodes[2].id
    end
  end
  
  context "spawning a node" do
    setup do
      @network = Nebula::Network.new
    end
    
    should 'be possible' do
      node = @network.spawn_node
      assert @network.spawn_node.is_a?(Nebula::Node)
    end
    
    should 'update node count' do
      assert_difference '@network.total_nodes' do
        @network.spawn_node
      end
    end
    
    should 'ensure node id is set' do
      @network.spawn_node
      assert_equal @network.total_nodes-1, @network.nodes.last.id
    end
    
    context "with a specific id" do
      setup do
        @count = @network.total_nodes
        @network.spawn_node(:id => 213)
      end

      should 'be created' do
        assert @network.nodes[213].is_a?(Nebula::Node)
      end
      
      should 'know its proper id' do
        assert @network.nodes[213].id == 213
      end
      
      should 'still have accurate node count' do
        assert_equal @count+1, @network.total_nodes
      end
      
      ## Maybe TODO
      # should 'raise error if node exists at that id' do
      # end
      
    end
  end
  
  context "spawning multiple nodes" do
    setup do
      @network = Nebula::Network.new
    end

    should 'be possible' do
      assert_difference '@network.total_nodes', 20 do
        @network.spawn_nodes(20)
      end
    end
  
    should 'accept options' do
      assert_nothing_raised do
        @network.spawn_nodes(5, :neighbor_count => 3)
      end
    end
    
    should 'pass-through options to spawn_node' do
      @network.expects('spawn_node').with({:test_arg => 'test'}).twice
      @network.spawn_nodes(2, :test_arg => 'test')
    end
  end
  

end