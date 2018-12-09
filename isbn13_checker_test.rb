require "minitest/autorun"
require_relative "isbn13_checker.rb"
class My_test < Minitest::Test
	def test1
		assert_equal(1,1)
	end
	def test_true
		assert_equal(true,checkthirteen("9780470059029"))
	end
end