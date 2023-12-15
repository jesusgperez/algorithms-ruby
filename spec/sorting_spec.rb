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

            0.upto(array.length - 2) do |i|
                expect(array[i] < array[i+1]).to be true
            end
        end
    end

    describe '#quick_sort' do
        it 'tests the quick sort algorithm' do
            array = [5,6,4,2,9,8,7,11,10]
            quick_sort(array, 0, array.length - 1)

            0.upto(array.length - 2) do |i|
                expect(array[i] < array[i+1]).to be true
            end
        end
    end

    describe '#count_smaller_after_self' do
        it 'tests the count smaller after self' do
            array = [5,6,4,2,9,8,7,11,10]
            smaller = count_smaller_after_self(array)

            expect(smaller).to eq([2,2,1,0,2,1,0,1,0])
        end
    end
end
