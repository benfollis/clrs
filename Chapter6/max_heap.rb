class HeapNode
  attr_accessor :key, :value
end
class MaxHeap

  # this class is pretty much stright out of CLRS

  def initialize()
    @heap = []
  end


  def fixup_heap(index)
    left = (2*index) + 1
    right = (2*index) + 2
    if left <= @heap.size-1 and @heap[left].key > @heap[index].key
      largest = l
    else
      largest = index
    end
    if right <= @heap_size-1 and @heap[right].key > @heap[largest].key
      largest = right
    end
    if largest != index
      #swap the index with the largest (maintaining heap)
      temp = @heap[index]
      @heap[index] = @heap[largest]
      @heap[largest] = temp
      fixup_heap(largest)
    end
  end

  def max
    @heap[0]
  end

  def increase_key(index, new_key)
    a[i]
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


