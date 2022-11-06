# Using the each method, write some code to output all of the 
# vowels from the strings.

# iterate through values associated with each key
# within each value, iterate through each string

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |value|
  string_split = ''
  value.each do |string|
    string_split = string.split('')
    string_split.each do |character|
    if character =~ /[aeiou]/ 
      puts character
    end
  end
  end
end