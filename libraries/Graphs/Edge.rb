module Graph
  class Edge
    attr_accessor :v1, :v2, :weight
    def initialize(v1, v2, weight = nil)
      @v1 = v1
      @v2 = v2
      @weight = weight
    end
  end
end
