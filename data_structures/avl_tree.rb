require_relative 'base_tree'


class AVLTree < BaseTree
    def initialize
        super
    end

    def insert(data)
        insert_recursive(@root, data)
    end

    def insert_recursive(tree, data)

    end

    def get_tree_height(tree)
        if tree.nil?
            return 0
        end

        tree.height
    end

    def get_tree_balance(tree)
        if tree.nil?
            return 0
        end

        get_tree_height(tree.left) - get_tree_height(tree.right)
    end

    private :insert_recursive
end

