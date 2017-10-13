class LRUCache
  def initialize(size)
    @chache = []
  end

  def count
    # returns number of elements currently in cache
    @chache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if el.is_a?(Hash)
      new_hash = el
      @chache.dup.each_with_index do |el2, idx2|
        if el2.is_a?(Hash)
          @chache.delete(el2)
          new_hash = el.merge(el2)
        end
      end
      @chache << new_hash
    elsif el.is_a?(Array)
      new_array = el
      @chache.dup.each_with_index do |el2, idx2|
        if el2.is_a?(Array)
          @chache.delete(el2)
          new_array = el + el2
        end
      end
      @chache << new_array.uniq
    elsif el.is_a?(Integer)
      new_int_sum = el
      @chache.dup.each_with_index do |el2, idx2|
        if el2.is_a?(Integer)
          @chache.delete(el2)
          new_int_sum += el2
        end
      end
    else
      @chache.delete(el)
      @chache << el
    end

    @chache
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @chache
  end

  private
  # helper methods go here!

end

#Tests:
# johnny_cache = LRUCache.new(4)
# johnny_cache.add([1,2,3])
# johnny_cache.add(5)
# johnny_cache.add(-5)
# johnny_cache.add({a: 1, b: 2, c: 3})
# johnny_cache.add([1,2,3,4])
# johnny_cache.add("I walk the line")
# johnny_cache.add(:ring_of_fire)
# johnny_cache.add("I walk the line")
# johnny_cache.add({a: 1, b: 2, c: 3})
#
# johnny_cache.show
