hsh = {
  'grape' => {
    type: 'fruit',
    colors: %w[red green],
    size: 'small'
  },
  'carrot' => {
    type: 'vegetable',
    colors: ['orange'],
    size: 'medium'
  },
  'apple' => {
    type: 'fruit',
    colors: %w[red green],
    size: 'medium'
  },
  'apricot' => {
    type: 'fruit',
    colors: ['orange'],
    size: 'medium'
  },
  'marrow' => {
    type: 'vegetable',
    colors: ['green'],
    size: 'large'
  }
}

capture_array = []

hsh.values.each do |el|
  capture_array << el[:colors].map { |color| color.capitalize } <<
    el[:size].upcase
end

capture_array = capture_array.uniq
p capture_array
