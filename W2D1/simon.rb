class Simon
	COLORS = %w(red blue green yellow)

	attr_accessor :sequence_length, :game_over, :seq 

	def initialize
		@game_over = false
		@sequence_length = 1 
		@seq = [] 
	end 

	def play
		until @game_over 
			take_turn
		end 

		game_over_message
		reset_game
	end 

	def take_turn
		show_sequence
		require_sequence

		unless @game_over 
			round_success_message
			@sequence_length += 1 
		end 
	end 

	def show_sequence
		add_random_color
		seq.each do |color|
			puts color 
			sleep 0.8 
			system("clear")
			sleep 0.4
		end  
	end 

	def require_sequence 
		puts "Guess the sequence eg:(red, blue, green)"
			input = gets.chomp 
			colors = input.split(', ')
			if colors != @seq 
				@game_over = true 
				break 
			end 
			sleep 0.5			
	end 

	def add_random_color
		random_color = COLORS.sample
		seq << random_color
	end 

	def round_success_message
		puts "Success!"
	end 

	def game_over_message
		puts "Game over!"
	end 

	def reset_game
		@seq = [] 
		@game_over = false 
		@sequence_length = 1
	end 

end 

game = Simon.new
game.play 