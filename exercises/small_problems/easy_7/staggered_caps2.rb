def staggered_case(string)
  staggered_string = ""
  need_upper = true
  string.split("").each do |char|
    if char.match?(/[a-zA-Z]/)
      if need_upper
        staggered_string += char.upcase
      else
        staggered_string += char.downcase
      end
      need_upper = !need_upper
    else
      staggered_string += char
    end
  end
  staggered_string
end

p staggered_case("I Love Launch School!") == "I lOvE lAuNcH sChOoL!"
p staggered_case("ALL CAPS") == "AlL cApS"
p staggered_case("ignore 77 the 444 numbers") == "IgNoRe 77 ThE 444 nUmBeRs"
