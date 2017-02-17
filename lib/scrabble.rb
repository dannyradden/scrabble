class Scrabble

  def score(word)
    word.upcase.chars.map do |letter|
      point_values[letter]
    end.reduce(:+)
  end

  def score_with_multipliers(word, letter_multiplier, word_multiplier = 1)
    word.upcase.chars.each_with_index.map do |letter, index|
      point_values[letter] * letter_multiplier[index]
    end.reduce(:+) * word_multiplier
  end

  def highest_scoring_word(word_array)
    highest_word = word_array[1]
    word_array.each do |word|
      highest_word = word if score(word) > score(highest_word)
      highest_word = word if score(word) == score(highest_word) && word.length < highest_word.length
      highest_word = word if score(word) == score(highest_word) && word.length == 7
    end
    highest_word
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end
end
