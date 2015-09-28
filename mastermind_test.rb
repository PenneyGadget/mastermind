gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'mastermind_code_for_testing'
require 'pry'

class MastermindTest < Minitest::Test

  def test_colors_are_rgby
    game = Mastermind.new
    assert_equal game.colors, ["r", "g", "b", "y"]
  end

  def test_first_color_is_red
    game = Mastermind.new
    assert_equal game.first_color, "r"
  end

  def test_sequence_has_four_colors
    game = Mastermind.new
    assert_equal game.colors.length, 4
  end

  def test_generate_sequence_returns_a_random_answer
    game = Mastermind.new
    game2 = Mastermind.new
    refute_equal game.generate_sequence, game2.generate_sequence
  end

  def test_it_is_singular
    game = Mastermind.new
    n = 1
    singular = "is"
    assert_equal game.pluralize(n, singular), "1 is"
  end

  def test_it_pluralizes
    game = Mastermind.new
    n = 2
    singular = "is"
    plural = "are"
    assert_equal game.pluralize(n, singular, plural), "2 are"
  end

end
