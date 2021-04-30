hsh = { first: ["the", "quick"], second: ["brown", "fox"], third: ["jumped"], fourth: ["over", "the", "lazy", "dog"] }
hsh.each do |k, v|
  v.each { |e| puts e.match(/[aeiou]/) }
end
