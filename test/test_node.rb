require File.dirname(__FILE__) + '/helper'

class TestNode < Test::Unit::TestCase

  context "Creating a node" do
    should 'accept an id argument' do
      node = Nebula::Node.new(:id => 25)
      assert_equal 25, node.id
    end
  end

end