require 'debug'
require 'rspec'
require 'byebug'
require_relative '../data_structures/linked_list'


RSpec.describe LinkedList do
    describe '#linked_list-insert' do
        it 'Insert one element into the linked list' do
            linked_list = LinkedList.new
            expect(linked_list.head).to eq(nil)
            linked_list.insert(data=5)
            expect(linked_list.head.data).to eq(5)
            expect(linked_list.tail.data).to eq(5)
            expect(linked_list.n).to eq(1)
            linked_list.insert(data=6)
            expect(linked_list.tail.data).to eq(6)
            expect(linked_list.head.next.data).to eq(6)
            expect(linked_list.n).to eq(2)
        end
    end

    describe '#linked_list-search' do
        it 'Search an element in the linked list' do
            linked_list = LinkedList.new
            for i in 1..5 do
                linked_list.insert(i)
            end
            expect(linked_list.head.data).to eq(1)
            expect(linked_list.tail.data).to eq(5)

            searched = linked_list.search(3)
            expect(searched.data).to eq(3)
            
            searched = linked_list.search(6)
            expect(searched).to eq(nil)
        end
    end
end
