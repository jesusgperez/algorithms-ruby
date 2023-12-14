require 'rspec'
require_relative '../data_structures/avl_tree'
require_relative '../data_structures/domain'


RSpec.describe AVLTree do
    describe '#avl_tree-get_tree_height' do
        it 'Gets the height of a tree' do
            avl_tree = AVLTree.new
            tree_node = AVLTreeNode.new(data=1)
            expect(
                avl_tree.get_tree_height(tree_node)
            ).to eq(1)
                
            expect(
                avl_tree.get_tree_height(nil)
            ).to eq(0)
        end
    end

    describe '#avl_tree-get_tree_balance' do
        it 'Gets the balance of a tree' do
            avl_tree = AVLTree.new
            tree_node = AVLTreeNode.new(data=1)
            tree_node.right = AVLTreeNode.new(data=3)
            expect(
                avl_tree.get_tree_balance(tree_node)
            ).to eq(-1)

            tree_node.left = AVLTreeNode.new(data=2)
            expect(
                avl_tree.get_tree_balance(tree_node)
            ).to eq(0)
        end
    end
end
