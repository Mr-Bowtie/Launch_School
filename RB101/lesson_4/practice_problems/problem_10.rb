munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" },
}
munsters.each do |_, value|
  age = value["age"]
  value["age_group"] = "kid" if age.between?(0, 17)
  value["age_group"] = "adult" if age.between?(18, 64)
  value["age_group"] = "senior" if age >= 65
end

p munsters
