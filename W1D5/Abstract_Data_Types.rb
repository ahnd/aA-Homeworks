class Stack
 attr_reader :stack 

  def initialize
  	@stack = []
  end 

  def push(el)
  	@stack.push(el)
  end 

  def pop
  	@stack.pop
  end 

  def peek
  	@stack[-1]
  end 
end 

class Queue
 attr_reader :queue

  def initialize
  	@queue = []
  end 

  def enqueue(el)
  	@queue.push(el)
  end 

  def dequeue
  	@queue.shift
  end 

  def peek
  	@queue[0]
  end
end 

def Map
 attr_reader :map
  def initialize 
  	@map = [] 
  end 

  def set(key, value)
  	idx = @map.index { |k, _| k == key }
  	if idx 
  	  @map[idx][1] = value 
  	else 
  	  @map << [key, value]
  	end 
  	[key, value]
  end 

  def get(key)
  	@map.each { |k, v| return v if k == key}
  end 

  def delete(key)
  	@map.delete_if { |k, v| k == key }
  end 

  def show
  	@map.dup 
  end 

end 

