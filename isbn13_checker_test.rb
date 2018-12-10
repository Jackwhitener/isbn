require "minitest/autorun"
require_relative "isbn13_checker.rb"
class My_test < Minitest::Test
	def test1
		assert_equal(1,1)
	end
	def test_true
		variable = "9780471486480"
		assert_equal(true,checkthirteen(numberlengththirteen(variable),variable))
	end
	def test_false
		variable = "9999999999999"

		assert_equal(false, checkthirteen(numberlengththirteen(variable),variable))
	end
	def test_true_again
		variable = "978 0 471 48648 0"
		assert_equal(true,checkthirteen(numberlengththirteen(variable),variable))
	end
	def test_true_dashes
		variable = "978-0-471-48648-0"
		assert_equal(true,checkthirteen(numberlengththirteen(variable),variable))
	end
	def test_for_letters
		variable = "thismightbrek"
		assert_equal(false,checkthirteen(numberlengththirteen(variable),variable))
	end
	def test_for_non_zero_confirm
		variable = "9780062801975"
		assert_equal(true,checkthirteen(numberlengththirteen(variable), variable))
	end
end