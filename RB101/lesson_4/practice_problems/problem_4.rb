ages = {
  'Herman' => 32,
  'Lily' => 30,
  'Grandpa' => 5843,
  'Eddie' => 10,
  'Marilyn' => 22,
  'Spot' => 237
}
p ages.values.reduce { |memo, n| (memo <=> n) == -1 ? memo : n }
