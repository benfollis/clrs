class HeapNode
  attr_accessor :key, :value
  def initialize()

  end
end
class MaxHeap

  #Implements a max heap that does not support negative numbers,
  # or decreasing a key
  # If negative numbers are required, then we'll need to
  # change insert and have a decrease key etc
  # This heap _also_ supports finding the index of an element in O(1)
  # time

  def initialize()
    @heap = []
    @locations = {}
  end

  def contents
    @heap
  end

  def positions
    @locations
  end

  def left(index)
    2*index + 1
  end

  def right(index)
    2*index + 2
  end

  def parent(index)
    (index / 2.0).floor
  end

  def swap(source, target)
    temp = @heap[source]
    @heap[source] = @heap[target]
    @locations[@heap[source].value] = source
    @heap[target] = temp
    @locations[@heap[target].value] = target
  end
  def index(value)
    #returns the index of an element with the given value
    @locations[value]
  end

  def fixup_heap(index)
    l = left(index)
    r = right(index)
    if l <= @heap.size-1 and @heap[l].key > @heap[index].key
      largest = l
    else
      largest = index
    end
    if r <= @heap_size-1 and @heap[r].key > @heap[largest].key
      largest = r
    end
    if largest != index
      #swap the index with the largest (maintaining heap)
      swap(index, largest)
      fixup_heap(largest)
    end
  end

  def insert(key, value)
    temp_node = HeapNode.new
    temp_node.value = value
    temp_node.key = -1
    @heap << temp_node
    @locations[value] = @heap.size-1 # maintain our location_index
    increase_key(@heap.size-1, key)
  end

  def increase_key(index, new_key)
    raise "Smaller Key" if new_key < @heap[index].key
    @heap[index].key = new_key
    while index > 0 and @heap[parent(index)].key < @heap[index].key
      #swap the index with it's parent
      swap(index, parent(index))
      index = parent(index)
    end
  end

  def extract_max
    max = @heap[0]
    @heap[0] = @heap.last
    @heap.pop
    fixup_heap(0)
    max
  end
end

heap = MaxHeap.new
heap.insert(5, "Foo")
heap.insert(4, "Baz")
heap.insert(6, "Bar")
heap.insert(7, "Bar")

#(0...100).each { |x| heap.insert(x, "Node #{x}")}
puts heap.contents.inspect
puts heap.positions.inspect

