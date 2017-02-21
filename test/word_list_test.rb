gem 'minitest'
require './lib/word_list'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class WordListTest < Minitest::Test
  def test_count
    list = WordList.new
    assert_equal 0, list.count
  end

  def test_add
    list = WordList.new
    list.add('hello')
    assert list.word_hash.include? 'hello'

    list.add('banana')
    assert list.word_hash.include? 'hello'
    assert list.word_hash.include? 'banana'

  end

  def test_total_score
    list = WordList.new
    list.add('hello')
    list.add('banana')
    assert_equal 16, list.total_score
  end

  def test_all
    list = WordList.new
    assert_equal 0, list.count       # => 0
    assert_equal 0, list.total_score # => 0

    list.add("hello")
    assert_equal 1, list.count       # => 1
    assert_equal 8, list.head.score  # => 8
    assert_equal 8, list.total_score # => 8

    list.add("hi")
    assert_equal 2, list.count       # => 2
    assert_equal 5, list.head.score  # => 5
    assert_equal 13,list.total_score # => 13

    list.add("snacker")
    assert_equal 3, list.count       # => 3
    assert_equal 13, list.head.score  # => 13
    assert_equal 26, list.total_score # => 26
  end
end
