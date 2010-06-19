require File.dirname(__FILE__) + '/helper'

class TestNodeList < Test::Unit::TestCase

  context "Node list creation" do

    context "when created by network" do
      setup do
        @network = Nebula::Network.new
        @node_list = @network.nodes
      end

      should 'be able to refer back to network' do
        assert_equal @network, @node_list.network
      end
    end
  end

  context "Counting nodes" do
    setup do
      @node_list = Nebula::NodeList.new
      @node_list << Nebula::Node.new(:id => 0)
    end

    should 'be able to count contained nodes' do
      assert_equal 1, @node_list.count
    end
    
    context "with non-contiguous nodes" do
      setup do
        @node_list[47] = Nebula::Node.new(:id => 47)
      end

      should 'count existing nodes with #count' do
        assert_equal 2, @node_list.count
      end
      
      should 'count existing nodes with #size' do
        assert_equal 2, @node_list.size
      end
      
      should 'return actual array length with #length' do
        assert_equal 48, @node_list.length
      end
    end
  end

end