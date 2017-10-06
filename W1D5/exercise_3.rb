require "byebug"
class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    kv_pair = [key, value]
    @map.each_with_index do |pair, idx|
      if pair.first == key
        @map[idx][-1] = value
        return
      end
    end
    @map << [key, value]
        # p @map

    # @map << kv_pair unless @map.include?(kv_pair)
  end

  def lookup(key)
    @map.each do |pair|
      return pair if pair.include?(key)
    end
    puts "key not found"
  end

  def remove(key)
    @map.each_with_index do |pair, idx|
      @map.delete(pair) if @map[idx].include?(key)
    end
  end

  def show
    @map
  end
end
