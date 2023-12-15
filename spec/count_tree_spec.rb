require 'rspec'
require 'byebug'
require_relative '../data_structures/count_tree'


RSpec.describe CountTree do
    describe '#count_tree-build' do
        it 'Created a basic count tree' do
            tree = CountTree.new(0, 10)

            expect(tree.root.indexes).to eq([0, 10])
            expect(tree.root.left.indexes).to eq([0, 5])
            expect(tree.root.right.indexes).to eq([6, 10])
        end
    end

    describe '#count_tree-update' do
        it 'Update the data from the tree' do
            tree = CountTree.new(0, 10)

            tree.update(10)
            tree.update(9)
            tree.update(1)

            expect(tree.root.data).to eq(3)
        end
    end

    describe '#count_tree-get_sum_range' do
        it 'Gets the sum range from the tree' do
            tree = CountTree.new(0, 10)

            tree.update(10)
            tree.update(9)
            tree.update(1)

            expect(tree.get_sum_range(8,10)).to eq(2)
            expect(tree.get_sum_range(1,3)).to eq(1)
            
            tree.update(2)
            tree.update(5)
            
            expect(tree.get_sum_range(1,3)).to eq(2)
            expect(tree.get_sum_range(1,6)).to eq(3)
            expect(tree.get_sum_range(5,6)).to eq(1)

        end
    end
end