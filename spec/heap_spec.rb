require 'rspec'
require 'byebug'
require_relative '../data_structures/heap'


RSpec.describe Heap do
    describe '#heap-get_parent' do
        it 'Gets the parent of a position' do
            heap = Heap.new
            heap.queue = [nil, 1, 2, 3]
            heap.n = 3

            expect(heap.get_parent(3)).to eq(1)
            expect(heap.get_parent(1)).to eq(-1)
        end
    end

    describe '#heap-get_child' do
        it 'Gets the child of a position' do
            heap = Heap.new
            heap.queue = [nil, 1, 2, 3]
            heap.n = 3

            expect(heap.get_child(1)).to eq(2)
            expect(heap.get_child(1, HEAP_CHILD[:RIGHT])).to eq(3)
            expect(heap.get_child(2, HEAP_CHILD[:RIGHT])).to eq(-1)
            expect(heap.get_child(3, HEAP_CHILD[:RIGHT])).to eq(-1)
        end
    end

    describe '#heap-insert' do
        it 'Inserts new data into the heap' do
            heap = Heap.new
            5.downto(1) do |i|
                heap.insert(i)
            end

            byebug

            expect(heap.queue[1]).to eq(1)

        end
    end
end
