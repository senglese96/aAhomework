require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
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
    input = require_sequence
    if !@game_over
      round_success_message
      @sequence_length += 1
      sleep(1)
    end
  end

  def show_sequence
    add_random_color
    print @seq
    sleep(2)
    system 'clear'
  end

  def require_sequence
    print "Please input the sequence you just saw, one color at a time"

    i = 0
    while i < @sequence_length
      puts "enter color"
      answer = gets.chomp

      if answer != seq[i]
        @game_over = true
        return false
      end
      i += 1
    end
  end

  def add_random_color
    @seq << ['red', 'green', 'yellow', 'green'].sample
  end

  def round_success_message
    print 'You got it right'
  end

  def game_over_message
    print 'incorrect, game over!'
  end

  def reset_game
    @sequence_length  = 1
    @game_over = false
    @seq = []
  end
end
