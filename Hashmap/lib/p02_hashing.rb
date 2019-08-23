class Integer
  # Integer#hash already implemented for you

end

class Array
  def hash
    final_hash = 0
    return 0.hash if self.empty? 

    self.each_with_index do |ele, i|
      final_hash += ele.hash * i 
    end 
    final_hash
  end
end

class String
  def hash
    arr = self.split('').map {|char| char.ord}
    arr.hash 
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # 0
    final_hash = 0
    return 0.hash if self.empty? 

    self.each do |k,v|
      final_hash += k.hash + v.hash   
    end 
    final_hash

  end
end
