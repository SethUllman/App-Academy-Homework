class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index {|ele, i| sum += (ele*(i + 1)).hash}
    sum
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a
    sum = 0
    self.each_char.with_index do |char, i|
      char_hash = alphabet.index(char.downcase)*(i + 1).hash
      sum += char_hash
    end
    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.each do |k, v|
      key = k.to_s
      sum += key.hash + v.hash
    end
    sum
  end
end
