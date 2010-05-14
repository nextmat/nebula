# This code is borrowed/modified from the most recent implementation in the ActiveSupport gem.

module Test::Unit::AssertDifference
  # Test numeric difference between the return value of an expression as a result of what is evaluated
  # in the yielded block.
  #
  #   assert_difference 'Article.count', -1, "An Article should be destroyed" do
  #     post :delete, :id => ...
  #   end
  def assert_difference(expression, difference = 1, message = nil, &block)
    b = block.send(:binding)
    exps = [expression]
    before = exps.map { |e| eval(e, b) }

    yield

    exps.each_with_index do |e, i|
      error = "#{e.inspect} didn't change by #{difference}"
      error = "#{message}.\n#{error}" if message
      assert_equal(before[i] + difference, eval(e, b), error)
    end
  end

  # Assertion that the numeric result of evaluating an expression is not changed before and after
  # invoking the passed in block.
  #
  #   assert_no_difference 'Article.count', "An Article should not be destroyed" do
  #     post :create, :article => invalid_attributes
  #   end
  def assert_no_difference(expression, message = nil, &block)
    assert_difference expression, 0, message, &block
  end
end

Test::Unit::TestCase.class_eval do
  include Test::Unit::AssertDifference
end
