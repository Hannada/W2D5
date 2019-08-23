require 'byebug'

class MaxIntSet
  attr_reader :store, :max

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end
  
  def insert(num)
    if is_valid?(num)
      validate!(num)
    else  
      raise "Out of bounds" 
    end 
  end
  
  def remove(num)
    store[num] = false 
  end
  
  def include?(num)
    store[num] == true 
  end
  
  private
  
  def is_valid?(num)
    num < max && num > 0
  end
  
  def validate!(num)
    @store[num] = true
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    # debugger 
    self[num] << num 
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store 

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
     if !self[num].include?(num)
      self[num] << num
      @count += 1
      resize! if count == @store.length 
     end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_buckets = 2 * num_buckets
    new_store = Array.new(new_buckets) { Array.new }

    @store.each do |bucket|
      bucket.each do |val|
        new_store[val % new_buckets] << val
      end
    end
    self.store = new_store
  end
end
