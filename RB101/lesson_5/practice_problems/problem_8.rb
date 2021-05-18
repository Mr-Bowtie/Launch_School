hsh = {
  first: %w[the quick],
  second: %w[brown fox],
  third: ['jumped'],
  fourth: %w[over the lazy dog]
}
hsh.each { |k, v| v.each { |e| puts e.match(/[aeiou]/) } }
