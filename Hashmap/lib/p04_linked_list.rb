
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  attr_reader :head, :tail 
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    
    @head.next = @tail 
    @tail.prev = @head 
  end
  
  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end
  
  def first
    @head.next if @head.next != @tail 
  end
  
  def last
    @tail.prev if @tail.prev != @head  
  end
  
  def empty?
    @head.next == @tail 
  end

  def get(key)

  end

  def include?(key)
    self.each do |node|
      true if key == node.key
    end
    false
  end

  def append(key, val)
    node = Node.new(key, val)

    if empty?
      head.next = node
      node.prev = head
      tail.prev = node
      node.next = tail
    end

    node.prev = last  
    last.next = node 
    node.next = @tail.prev 
    @tail.prev = node 

  end

  def update(key, val)

  end

  def remove(key)
    node.prev.next = node.next
    node.next.prev = node.prev
  end

  def each
    current_node = first 

    while current_node != last
      self.current_node
      current_node = current_node.next  
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
