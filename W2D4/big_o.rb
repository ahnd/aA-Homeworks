['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

class Array 
#0(n^2) quadratic (factorials)
	def sluggish_oct
		biggest = self.first 
		sorted = false

    until sorted
      sorted = true
      (0...self.length-1).each do |idx|
        if self[idx].length > self[idx + 1].length
          self[idx], self[idx + 1] = self[idx + 1], self[idx]
          sorted = false
        end
      end
    end

    self.last
	end 


#0(n log n) merge sort

	def dominant_oct(&prc)
		prc ||= Proc.new {|x, y| x.length <=> y.length}
		return self if self.length <= 1 

		mid = self.length/2 

		left = self.take(mid).dominant_oct(&prc)
		right = self.drop(mid).dominant_oct(&prc)

		merge(left, right, &prc).last 
	end 

	def merge(left, right, &prc)
		res = [] 
		until left.empty? || right.empty?
			case prc.call{|x, y| x.length <=> y.length}
			when -1 || 0 
				res << left.shift
			when 1 
				res << right.shift
			end 
			res + left + right 
	end 



#0(n) linear 
	def clever_oct 
		biggest = self.first 
		self.each do |fish| 
			if fish.length > biggest.length 
				biggest = fish 
			end 
		end 
		biggest 
	end 

	def slow_dance(direction)
		self.each_with_index do |move, idx| 
			return idx if move == direction
		end 
	end 

	def constant_dance(direction) 
		new_tiles = self.dup 
		new_tiles[direction]
	end 

end 