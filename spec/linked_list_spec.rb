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

    describe '#linked_list-delete' do
        it 'Delete an element from a linked list' do
            linked_list = LinkedList.new
            (1..6).each do |i|
                linked_list.insert(i)
            end

            expect(linked_list.n).to eq(6)
            removed = linked_list.delete(5)
            expect(removed).to eq(5)
            expect(linked_list.n).to eq(5)
            
            removed = linked_list.delete(6)
            expect(removed).to eq(6)

            removed = linked_list.delete(7)
            expect(removed).to eq(nil)
        end
    end

    describe '#linked_list-has_cycle' do
        it 'Verifies if theres a cycle in the list' do
            linked_list = LinkedList.new
            
            (1..10).each do |i|
                linked_list.insert(i)
            end

            linked_list.tail.next = linked_list.head

            expect(
                linked_list.has_cycle(node=linked_list.head)
            ).to eq(true)
        end
    end
end
