require './lib/scrabble'

class WordList < Scrabble

  attr_accessor :word_hash, :head

  def initialize
    @word_hash = {}
  end

  def count
    word_hash.count
  end

  def add(word)
    word_hash[word] = score(word)
    @head = word
  end

  def total_score
    count.zero? ? 0 : word_hash.values.reduce(:+)
  end
end
