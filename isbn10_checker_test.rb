require "minitest/autorun"
require_relative "isbn10_checker.rb"
class My_test < Minitest::Test
	def test1
		assert_equal(1,1)
	end
	def test_forfalse
		assert_equal(false,checkten('124829927'))
	end
	def test_fortrue
		assert_equal(true,checkten('7421394761'))
	end
	def test_forinvalid
		assert_equal(false,checkten('877195x869'))
	end
	def test_for_another_valid
		assert_equal(true, checkten("877195869x"))
	end
	def test_for_a_different_valid
		assert_equal(true,checkten("0-321-14653-0"))
	end
end
