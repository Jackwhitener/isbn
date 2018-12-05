require "minitest/autorun"
require_relative "isbn10_checker.rb"
class My_test < Minitest::Test
	def test1
		assert_equal(1,1)
	end
	def test_forfalse
		assert_equal(false,checkten('this is not a valid form of isbn10'))
	end
	def test_fortrue
		assert_equal(true,checkten('7421394761'))
	end
	def test_forinvalid
		assert_equal(false,checkten('877195x869'))
	end
end
