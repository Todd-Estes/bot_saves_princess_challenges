require 'minitest/autorun'
require './lib/validate_input.rb'

class ValidateInputTest < Minitest::Test

  def test_it_checks_for_numbers_less_than_3
    n = 1
    expected = /RE-ENTER INPUT PARAMETERS\n/
    assert_output(expected) { ValidateInput.check_size(n) }
  end

  def test_it_checks_for_odd_numbers
    n = 6
    expected = /RE-ENTER INPUT PARAMETERS\n/
    assert_output(expected) { ValidateInput.check_size(n) }
  end

  def test_it_checks_for_numbers_over_99
    n = 100
    expected = /RE-ENTER INPUT PARAMETERS\n/
    assert_output(expected) { ValidateInput.check_size(n) }
  end
end
