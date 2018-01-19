require 'byebug'

class PolyTreeNode
  attr_accessor :value, :children, :parent
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if node.nil? == false
      if self.parent != nil
        self.parent.children.delete(self)
      end
      @parent = node
      node.children << self
    else
      @parent = nil
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if child_node.parent != self
      raise "Not a child"
    else
      child_node.parent = nil
      self.children.delete(child_node)
    end
  end

  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      result = child.dfs(target_value)
      return result if result.is_a? PolyTreeNode
    end
    return nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      current_node.children.each do |child|
        queue << child
      end
    end
    return nil
  end

end




# def parent=(node)
#   if node.nil? == false
#     if self.parent != nil
#       self.parent.children.delete(self)
#     end
#     @parent = node
#     node.children << self
#   else
#     @parent = nil
#   end
# end
#
#
# def add_child(child_node)
#   child_node.parent = self
# end
#
# def remove_child(child_node)
#   if child_node.parent != self
#     raise "Not a child"
#   else
#     child_node.parent = nil
#     self.children.delete(child_node)
#   end
# end
