require 'rspec'
require 'byebug'
require_relative '../algos/sorting'


RSpec.describe 'Sorting' do
    describe '#heap_sort' do
        it 'tests the heapsort algorithm' do
            array = [5,6,4,2,9,8,7,11,10]
            sorted = heap_sort(array)

            0.upto(sorted.length - 2) do |i|
                expect(sorted[i] < sorted[i+1]).to be true
            end
        end
    end

    describe '#merge_sort' do
        it 'tests the merge sort algorithm' do
            array = [5,6,4,2,9,8,7,11,10]
            merge_sort(array, 0, array.length - 1)

            byebug

            0.upto(array.length - 2) do |i|
                expect(array[i] < array[i+1]).to be true
            end
        end
    end
end
