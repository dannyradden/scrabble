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
    assert_equal 9, Scrabble.new.score("home")
    assert_equal 6, Scrabble.new.score("sound")
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

  def test_highest_scoring_word
    assert_equal 'home', Scrabble.new.highest_scoring_word(['home', 'word', 'hello', 'sound'])
    assert_equal 'word', Scrabble.new.highest_scoring_word(['hello', 'word', 'sound'])
    assert_equal 'silence', Scrabble.new.highest_scoring_word(['hello', 'word', 'silence'])
    assert_equal 'word', Scrabble.new.highest_scoring_word(['hi', 'word', 'ward'])  # => "word"
  end

end
