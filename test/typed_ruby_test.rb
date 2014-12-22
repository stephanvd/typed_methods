require 'test/unit'
require './lib/typed_methods'

class TypedMethodsTest < Test::Unit::TestCase

  def setup
  end

  def teardown
  end

  def test_can_call_multiply_and_print
    assert_send [Toy.new, :multiply_and_print, 3, 4, "Answer is: "]
  end

  def test_returns_the_result
    result = Toy.new.multiply_and_print 3, 4, "Answer is: "
    assert_equal "Answer is: 12", result
  end

  def test_throws_argument_type_error
    assert_raise TypedMethods::ArgumentTypeError do
      Toy.new.multiply_and_print "a", 4, "Foobar is: "
    end
  end

  def test_throws_return_type_error
    assert_raise TypedMethods::ReturnTypeError do
      Toy.new.multiply_wrong_return 5, 4
    end
  end
end

class Toy
  extend TypedMethods

  tdef :multiply_and_print, number1: Fixnum, number2: Fixnum, text: String, return: String do
    "#{text}#{number1 * number2}"
  end

  tdef :multiply_wrong_return, number1: Fixnum, number2: Fixnum, return: String do
    number1 * number2
  end
end
