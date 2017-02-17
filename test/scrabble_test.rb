gem 'minitest'
require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ScrabbleTest < Minitest::Test

  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_word
    assert_equal 4, Scrabble.new.score("and")
    assert_equal 11, Scrabble.new.score("funny")
  end

  def test_letter_multiplier
    assert_equal 9, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_word_multiplier
    assert_equal 16, Scrabble.new.score_with_multipliers('hello', [1,1,1,1,1], 2)
  end

  def test_letter_and_word_multiplier
    assert_equal 18, Scrabble.new.score_with_multipliers('hello', [1,1,2,1,1], 2)
  end

end
