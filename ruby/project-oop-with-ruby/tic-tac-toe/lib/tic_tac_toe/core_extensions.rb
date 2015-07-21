class Array
  def all_empty?
    self.all? { |element| element.to_s.empty? }
  end

  def all_same?
    self.all? { |element| element == self[0] }
  end

  def any_empty?
    self.any? { |element| element.to_s.empty? }
  end

  def none_empty?
    !any_empty?
  end
end

# puts ["", "", ""].all_empty?.to_s
# puts ["", "1", ""].all_empty?.to_s
# puts [].all_empty?.to_s

# puts ["A", "A", "A"].all_same?.to_s
# puts ["A", "1", "A"].all_same?.to_s
# puts [].all_same?.to_s

def meow_cats_crow_at_midnight
  return "Will rspec load up this function?"
end