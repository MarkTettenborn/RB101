flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# find index of first name starting with "Be

be = flintstones.index { |name| name[0, 2] == "Be"}

puts be