flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles Benny)

# find index of first name starting with "Be"

be_start = flintstones.select {|name| name[0, 2] == 'Be'}
puts be_start

first_be = be_start.first
puts first_be
