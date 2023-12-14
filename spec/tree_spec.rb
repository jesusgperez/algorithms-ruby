require 'rspec'
require 'byebug'
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

    describe '#avl_tree-adjust_height' do
        it 'Adjusts the height of a tree' do
            avl_tree = AVLTree.new
            tree_node = AVLTreeNode.new(data=1)
            tree_node.right = AVLTreeNode.new(data=3)
            tree_node.left = AVLTreeNode.new(data=2)
            expect(tree_node.height).to eq(1)
            
            avl_tree.adjust_height(tree_node)
            expect(tree_node.height).to eq(2)
        end
    end

    describe '#avl_tree-right_rotation' do
        it 'Adjusts the height of a tree' do
            avl_tree = AVLTree.new
            tree_node = AVLTreeNode.new(data=1)
            tree_node.left = AVLTreeNode.new(data=3)
            tree_node.left.left = AVLTreeNode.new(data=2)
            avl_tree.root = tree_node

            avl_tree.right_rotate(tree_node)

            expect(avl_tree.root.data).to eq(3)
            expect(avl_tree.root.left.data).to eq(2)
            expect(avl_tree.root.right.data).to eq(1)
        end
    end

    describe '#avl_tree-left_rotation' do
        it 'Adjusts the height of a tree' do
            avl_tree = AVLTree.new
            tree_node = AVLTreeNode.new(data=1)
            tree_node.right = AVLTreeNode.new(data=3)
            tree_node.right.right = AVLTreeNode.new(data=2)
            avl_tree.root = tree_node

            avl_tree.left_rotate(tree_node)

            expect(avl_tree.root.data).to eq(3)
            expect(avl_tree.root.left.data).to eq(1)
            expect(avl_tree.root.right.data).to eq(2)
        end
    end

    describe '#avl_tree-insertion' do
        it 'Inserts an element into the balanced tree' do
            avl_tree = AVLTree.new
            for i in (1..7) do 
                avl_tree.insert(i)
            end

            expect(avl_tree.root.data).to eq(4)
        end
    end
end
