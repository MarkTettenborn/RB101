# Given this previously seen family hash, print out the name, 
# age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, values|
  age = ''
  gender = ''
  values.each do |a, b|
    age = values["age"]
    gender = values["gender"]
  end
puts "#{key} is #{age} and #{gender}"
end