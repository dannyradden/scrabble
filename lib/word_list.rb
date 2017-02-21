require './lib/scrabble'

class WordList

  attr_accessor :word_hash, :score

  def initialize
    @word_hash = {}
  end

  def count
    word_hash.count
  end

  def add(word)
    @head_word = word
    word_hash[word] = Scrabble.new.score(word)
  end

  def total_score
    count.zero? ? 0 : word_hash.values.reduce(:+)
  end

  def head
    Head.new(@head_word)
  end
end

class Head
  attr_reader :word, :score
  def initialize(word)
    @word = word
    @score = Scrabble.new.score(word)
  end
end
