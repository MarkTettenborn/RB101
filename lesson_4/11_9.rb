words = "the flintstones rock"

# words = "The Flintstones Rock"

def titlecase(string)
  words = string.split(' ')
  title_words = words.map { |word| word.capitalize}
  puts title_words.join(' ')
end

puts titlecase(words)