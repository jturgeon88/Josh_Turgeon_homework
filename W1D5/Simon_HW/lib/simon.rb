class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    until game_over
      take_turn
      system("clear")
    end
    game_over_message
    reset_game

  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless @game_over
    @sequence_length += 1 unless @game_over

  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 1.0
      system("clear")
      sleep 0.25
    end

  end

  def require_sequence
    puts "Try to repeat the sequence:"
    @seq.each do |color|
      user_input = gets.chomp
      if color[0] != user_input
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Successful round!! Get ready:"

  end

  def game_over_message
    puts "Game over suckaaa! You got to level #{@sequence_length - 1}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
