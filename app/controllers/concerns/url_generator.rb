module UrlGenerator
  def generate_url(id)
    url = ""
    first_letters = "abcdefghij"
    second_letters = "klmnopqrstuvwxyz"
    id.to_s.chars.map(&:to_i).each do |digit|
      url += if digit.even?
               first_letters[digit]
             else
               second_letters[digit]
             end
    end

    url
  end
end
