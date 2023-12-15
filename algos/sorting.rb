require_relative '../data_structures/heap'

def heap_sort(array)
    heap = Heap.new
    heap.make(array)

    response = []

    (array.length - 1).times do
        response.append(heap.extract_minimum)
    end

    response
end


def merge_sort(array, low, high)
    if low < high
        mid = (low + high) / 2
        merge_sort(array, low, mid)
        merge_sort(array, mid + 1, high)
        merge(array, low, mid, high)
    end
end

def merge(array, low, mid, high)
    left_array, right_array = [], []

    (low..mid).each do |i|
        left_array.append(array[i])
    end
    (mid+1..high).each do |i|
        right_array.append(array[i])
    end

    i = low

    while !left_array.length.zero? && !right_array.length.zero?
        if left_array[0] < right_array[0]
            array[i] = left_array.shift
        else
            array[i] = right_array.shift
        end
        i += 1
    end

    until left_array.length.zero?
        array[i] = left_array.shift
        i += 1
    end

    until right_array.length.zero?
        array[i] = right_array.shift
        i += 1
    end
end
