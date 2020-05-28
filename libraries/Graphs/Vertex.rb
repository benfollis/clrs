module Graph
  class Vertex
    attr_accessor :name, edges
    def initialize(name, edges)
      @name = name
    end
  end
end
