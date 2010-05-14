require File.dirname(__FILE__) + '/helper'

class TestNetwork < Test::Unit::TestCase

  context "A new network" do
    setup do
      @network = Nebula::Network.new
    end

    should 'report total node count' do
      assert_equal 0, @network.total_nodes
    end

    context "spawning nodes" do
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
    
    should 'link nodes after their creation' do
      
    end
    
    should 'provide hash-like access to nodes' do
      @network.spawn_node
      assert @network.nodes[0].is_a?(Nebula::Node)
    end
  end

end