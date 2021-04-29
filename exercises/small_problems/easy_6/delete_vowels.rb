VOWELS = %w(a e i o u)

def remove_vowels(arr)
  arr.map { |string|
    string = string.chars.reject { |char|
      VOWELS.include?(char.downcase)
    }
    string.join
  }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ["BC", "", "XYZ"]
