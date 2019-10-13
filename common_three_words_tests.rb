gem 'test-unit'
require 'test/unit'
require 'test/unit/ui/console/testrunner'

# Tests
# class DeserializerTest < Test::Unit::TestCase
#   def test_deserialize_array()
#     assert_equal([10, 13, 1].deserialize_array, [10, 13, 1])
#     assert_equal([10, [13, 1], 5].deserialize_array, [10, 13, 1, 5])
#     assert_equal([10, [13, 1, [5, 6], 7], 8, 9].deserialize_array, [10, 13, 1, 5, 6, 7, 8, 9])
#     assert_equal([].deserialize_array, [])
#     assert_equal([[[], []], [[[]]]].deserialize_array, [])
#   end
# end