require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    cups.each_with_index do |cup, ind|
      unless ind == 6 || ind == 13
        cup.concat([:stone,:stone,:stone,:stone])
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 12 || start_pos < 0
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    cups[start_pos] = []
    next_cup = start_pos
    until stones.empty?
      next_cup += 1
      next_cup = 0 if next_cup > 13
      if current_player_name == @name1
        cups[next_cup] << stones.pop unless next_cup == 13
      else
        cups[next_cup] << stones.pop unless next_cup == 6
      end
    end
    render
    next_turn(next_cup)
  end

  def next_turn(ending_cup_idx)
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
    if @cups[1..6].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
      return true
    end
    false
  end

  def winner
    return :draw if @cups[6].count == @cups[13].count
    @cups[6].count > @cups[13].count ? @name1 : @name2
  end
end
