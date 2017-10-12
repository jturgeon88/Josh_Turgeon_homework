fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# O(n^2) time
def sluggish_o(fishes)
  longest_fish = []
  fishes.each_index do |idx1|
    fishes.each_index do |idx2|
      next if idx1 == idx2
      if fishes[idx1].length > fishes[idx2].length
        longest_fish << fishes[idx1] unless fishes[idx1] < longest_fish[0].length
      else
        longest_fish << fishes[idx2] unless fishes[idx2] < longest_fish[0].length
      end
    end
  end
  longest_fish[0]
end

#O(n log n) time
def merge_sort(array, &prc)
  return array if array.length <= 1

  mid = array.length / 2
  left_sorted = merge_sort(array.take(mid), &prc)
  right_sorted = merge_sort(array.drop(mid), &prc)

  merge(left_sorted, right_sorted, &prc)

end

def merge(left, right, &prc)
  merged = []
  prc ||= Proc.new {|x, y| x.length <=> y.length}

  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end

    merged.concat(left)
    merged.concat(right)
    merged

end

def dominant_o(fishes)
  merge_sort(fishes).last

end

def clever_o(array)
  longest_fish = ""
  array.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end
  return longest_fish
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  array.each_with_index do |dir, tentacle|
    return tentacle if dir == direction
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
    }

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]

end
