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
            linked_list.insert(data=6)
            byebug
            expect(linked_list.tail.data).to eq(6)
            expect(linked_list.head.next.data).to eq(6)
        end
    end
end
