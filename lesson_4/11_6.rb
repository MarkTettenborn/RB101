flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# shorten each name to first three characters

short_names = flintstones.map { |name| name = name[0,3] }

puts short_names