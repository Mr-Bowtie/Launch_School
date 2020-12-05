flinstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flinstones_hash = flinstones.each_with_object({}) do |element, hash|
  hash[element] = flinstones.index(element)
end
p flinstones_hash
