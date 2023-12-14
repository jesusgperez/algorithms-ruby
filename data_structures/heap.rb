require_relative 'domain'

MAX_SIZE = 64


class Heap
    attr_accessor :queue, :n
    attr_reader :size

    def initialize(size = MAX_SIZE)
        @queue = [nil] * size
        @size = size
        @n = 0
    end


    def insert(data)
        if @n >= @size
            return nil
        end

        @n += 1
        @queue[@n] = data
        self.bubble_up(@n)
    end

    def bubble_up(position)
        parent = self.get_parent(position)
        if parent == -1
            return
        end

        if @queue[parent] > @queue[position]
            self.swap(parent, position)
            self.bubble_up(parent)
        end
    end

    def swap(left, right)
        if left > @n || right > @n
            return
        end

        buffer = @queue[left]
        @queue[left] = @queue[right]
        @queue[right] = buffer
    end

    def get_parent(position)
        parent = position / 2
        if parent < 1
            return -1
        end

        parent
    end

    def get_child(position, type = HEAP_CHILD[:LEFT])
        child = (if type == HEAP_CHILD[:LEFT] then 
                position * 2 else position * 2 + 1 end)

        if child > @n
            return -1
        end

        child
    end
end
