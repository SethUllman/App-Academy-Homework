def first_anagram?(string1, string2)
  perms = string1.split('').permutation(string1.length).to_a #n!
  perms.any? {|perm| perm.join('') == string2} #n!
end

def second_anagram?(string1, string2)
  chars2 = string2.split('')
  string1.each_char do |char| #n
    if chars2.include?(char) #n
      chars2.delete_at(chars2.index(char)) #n
    else
      return false
    end
  end
  chars2.empty?
end

def third_anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort #n^2
end

def fourth_anagram?(string1, string2)
  hash1 = Hash.new {|h, k| h[k] = 0}
  hash2 = Hash.new {|h, k| h[k] = 0}
  string1.each_char {|char| hash1[char] += 1} #n
  string2.each_char {|char| hash2[char] += 1} #n
  hash1 == hash2 #n
  # hash1 = Hash.new {|h, k| h[k] = 0}
  # string1.each_char {|char| hash1[char] += 1} #n
  # string2.each_char {|char| hash1[char] -= 1} #n
  # hash1.values.all? {|value| value == 0 } #n
end