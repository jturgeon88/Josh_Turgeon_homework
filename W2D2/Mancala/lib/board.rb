class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    @cups = @cups.each_index {|idx| @cups[idx] = [:stone, :stone, :stone, :stone] unless idx == 6 || idx == 13}
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos < 1 || start_pos > 14
      raise "Invalid starting cup"
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
        @cups[idx] << stones.shift unless current_player_name == @name2
      # debugger
      elsif idx == 13
        @cups[idx] << stones.shift unless current_player_name == @name1

      else
        @cups[idx] << stones.shift
      end
    end
    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1 # && ending_cup_idx != 6 && ending_cup_idx != 13
      :switch
    else
      ending_cup_idx
    end

    # helper method to determine what #make_move returns
  end

  def render
    print "     #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0...6].all? { |cup| cup.empty? } || @cups[7...13].all? { |cup| cup.empty? }
      return true
    else
      false
    end
  end

  def winner
    if @cups[6].length == @cups[13].length
      :draw
    elsif @cups[6].length > @cups[13].length
      @name1
    else
      @name2
    end

  end
end
