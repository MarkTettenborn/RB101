ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people aged 100+

ages_less_than_100 = ages.select { |key, value| value <= 100}

puts ages_less_than_100