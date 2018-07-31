class InvalidStartingCup < StandardError; end 
class EmptyStartingCup < StandardError; end 

class Board
  attr_accessor :cups

  def initialize(name1, name2)
  	@name1, @name2 = name1, name2
  	@cups = Array.new(14){Array.new}
  	place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
    	next if idx == 6 || idx == 13 
    	4.times do
    		cup << :stone 
    	end 
    end 
  end

  def valid_move?(start_pos)
  	if start_pos < 0 || start_pos > 12 
  		raise InvalidStartingCup.new "Try again" 
  	elsif @cups[start_pos].empty? 
  		raise EmptyStartingCup.new "Starting cup is empty"
  	end 
  end

  def make_move(start_pos, current_player_name)
  	stones = @cups[start_pos]
  	@cups[start_pos] = [] 

  	idx = start_pos
  	until stones.empty? 
  		idx += 1 
  		idx = 0 if idx > 13 
  		if idx == 6 
  			@cups[6] << stones.pop if current_player_name == @name1
  		elsif idx == 13
  			@cups[13] << stones.pop if current_player_name == @name2
  		else 
  			@cups[idx] << stones.pop
  		end 
  	end 
  	render
  	next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13 
    	:prompt 
    elsif @cups[ending_cup_idx].count == 1 
    	:switch 
    else 
    	ending_cup_idx
    end 
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  	@cups[0..6]all? {|cup| cup.empty?} || @cups[7..12]all? {|cup| cup.empty?}
  end

  def winner
  	p1_count = @cups[6].count 
  	p2_count = @cups[13].count 

  	if p1_count == p2_count
  		puts "Draw!"
  	elsif p1_count > p2_count 
  		@name1
  	else @name2 
  	end  
  end
end
