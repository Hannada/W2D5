class HashSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !self.include?(key)
      self[key] << key
      @count += 1
      resize! if count == num_buckets
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count -= 1
      
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_buckets = 2 * num_buckets
    new_store = Array.new(new_buckets) { Array.new }

    @store.each do |bucket|
      bucket.each do |val|
        new_store[val.hash % new_buckets] << val
      end
    end
    self.store = new_store
  end
end
