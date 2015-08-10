class Node
  attr_accessor :value, :parent, :left_child, :right_child

  def initialize(value, parent = nil, left_child = nil, right_child = nil)
    @value = value
    @parent = parent
    @left_child = left_child
    @right_child = right_child
  end

  # Easy to read note output
  def to_s
    string =  "< Node: @value = #{@value}\n"
    string += @parent.nil? ? "\t@parent = Nil\n" : "\t@parent = #{@parent.value}\n"
    string += @left_child.nil? ? "\t@left_child = Nil\n" : "\t@left_child = #{@left_child.value}\n"
    string += @right_child.nil? ? "\t@right_child = Nil>" : "\t@right_child = #{@right_child.value}>"
    string
  end

  # Enables comparitive operators
  def <=>(other)
    @value <=> other.value
  end
end