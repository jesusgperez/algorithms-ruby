
class LNode
    attr_accessor :data, :next

    def initialize(data, next_value = nil)
        @data = data
        @next = next_value
    end
end

class DNode < LNode
    attr_accessor :previous

    def initialize(data, next_value = nil, previous = nil)
        super
        @previous = previous
    end
end
