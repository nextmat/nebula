require File.dirname(__FILE__) + '/helper'

class TestNetwork < Test::Unit::TestCase

  context "A new network" do
    setup do
      @network = Nebula::Network.new
    end

    should 'report total node count' do
      assert_equal 0, @network.total_nodes
    end

    should 'link nodes after their creation' do
      #TODO
    end
    
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