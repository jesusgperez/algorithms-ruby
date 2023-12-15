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


    def make(array)
        @n = array.length
        array.insert(0, nil)
        @queue = array + [nil] * (@size - @n)        

        mid = @n / 2

        mid.downto(0) do |i|
            self.bubble_down(i)
        end
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

    def extract_minimum
        if @n < 1
            return nil
        end

        min_value = @queue[1]
        @queue[1] = @queue[@n]
        @queue[@n] = nil
        @n -= 1
        self.bubble_down(1)
        return min_value
    end

    def bubble_down(position)
        left_child = self.get_child(position, HEAP_CHILD[:LEFT])
        min_value = position

        2.times do |i|
            current = left_child + i
            if current > @n
                break
            end

            if @queue[current].nil?
                break
            end

            if @queue[current] < @queue[min_value]
                min_value = current
            end
        end

        if min_value != position
            self.swap(position, min_value)
            self.bubble_down(min_value)
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
