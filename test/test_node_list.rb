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
  
  context "Creating a node" do
    setup do
      @network = Nebula::Network.new
      @node_list = @network.nodes
    end
    
    should 'be possible' do
      node = @node_list.create
      assert node.is_a?(Nebula::Node)
    end
    
    should 'update node count' do
      assert_difference '@node_list.count' do
        @node_list.create
      end
    end
    
    should 'ensure node id is set' do
      node = @node_list.create
      assert_not_nil node.id
    end
    
    context "with a specific id" do
      setup do
        @count = @node_list.count
        @node_list.create(:id => 213)
      end

      should 'be created' do
        assert @node_list[213].is_a?(Nebula::Node)
      end
      
      should 'know its proper id' do
        assert @node_list[213].id == 213
      end
      
      should 'still have accurate node count' do
        assert_equal @count+1, @node_list.count
      end
      
      ## Maybe TODO
      # should 'raise error if node exists at that id' do
      # end
      
      context "which is smaller than a previous node" do
        setup do
          @count = @node_list.count
          @node = @node_list.create(:id => 43)
        end

        should 'return proper node' do
          assert_equal 43, @node.id
        end
        
        should 'keep proper count' do
          assert_equal @count+1, @node_list.count
        end
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