require_relative 'player'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    (0..13).each{|i| cups[i] = [:stone, :stone, :stone, :stone] unless i == 6 || i == 13}
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
      raise InvalidStartError
    elsif cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    system 'clear'
    stones = cups[start_pos].dup
    cups[start_pos] = []
    i = start_pos
    until stones.empty?
      i += 1
      i -= 14 if i > 13
      if (current_player_name == @player1.name && i != 13)
        cups[i] << stones.pop
      elsif current_player_name == @player2.name && i != 6
        cups[i] << stones.pop
      end
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
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
    return true if (0..5).all?{|i| cups[i].empty?}
    return true if (7..12).all?{|i| cups[i].empty?}
    return false
  end

  def winner
    if cups[6].length > cups[13].length
      return @player1.name
    elsif cups[6].length == cups[13].length
      return :draw
    else
      return @player2.name
    end
  end
end

class InvalidStartError < StandardError
  def message
    "Invalid starting cup"
  end
end