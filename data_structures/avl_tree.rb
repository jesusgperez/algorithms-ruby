require_relative 'base_tree'


class AVLTree < BaseTree
    def initialize
        super
    end

    def insert(data)
        insert_recursive(@root, data)
    end

    def insert_recursive(tree, data)
        if tree.nil?
            return AVLTreeNode(data=data)
        end

        if data < tree.data
            tree.left = self.insert_recursive(tree.left, data)
        elsif data > tree.data
            tree.right = self.insert_recursive(tree.right, data)
        end

        self.adjust_height(tree)

        balance = self.get_tree_balance(tree)

        if balance > 1 && data < tree.left.data
            return self.right_rotate(tree)
        elsif balance < -1 && data > tree.right.data
            return self.left_rotate(tree)
        elsif balance > 1 && data > tree.left.data
            tree.left = self.left_rotate(tree.left)
            return self.right_rotate(tree)
        elsif balace < -1 && data < tree.right.data
            tree.right = self.right_rotate(tree.right)
            return self.left_rotate(tree)
        end

        return tree
    end

    def right_rotate(z)
        if z.nil? || z.left.nil?
            return z
        end

        y = z.left
        t2 = y.right

        z.left = t2
        y.right = z

        if z == @root
            @root = y
        end

        self.adjust_height(z)
        self.adjust_height(y)

        y
    end

    def left_rotate(z)
        if z.nil? || z.right.nil?
            return z
        end

        y = z.right
        t2 = y.left

        z.right = t2
        y.left = z

        if z == @root
            @root = y
        end

        self.adjust_height(z)
        self.adjust_height(y)

        y
    end

    def adjust_height(tree)
        unless tree.nil?
            tree.height = (
                1 + [get_tree_height(tree.left), get_tree_height(tree.right)].max
            )
        end
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

        self.get_tree_height(tree.left) - self.get_tree_height(tree.right)
    end

    private :insert_recursive
end

