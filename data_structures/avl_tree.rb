require_relative 'base_tree'
require_relative 'domain'


class AVLTree < BaseTree
    def initialize
        super
    end

    def insert(data)
        tree = insert_recursive(@root, data)

        @n += 1

        if @root.nil?
            @root = tree
        end

        tree
    end

    def insert_recursive(tree, data)
        if tree.nil?
            return AVLTreeNode.new(data=data)
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
        elsif balance < -1 && data < tree.right.data
            tree.right = self.right_rotate(tree.right)
            return self.left_rotate(tree)
        end

        return tree
    end

    def delete(data)
        deleted = delete_recursive(@root, data)

        unless deleted.nil?
            @n -= 1
        end

        deleted
    end

    def delete_recursive(tree, data)
        if tree.nil?
            return tree
        end

        if data < tree.data
            tree.left = delete_recursive(tree.left, data)

        elsif data > tree.data
            tree.right = delete_recursive(tree.right, data)
        else
            if tree.left.nil?
                tmp = tree.right
                tree = nil
                return tmp

            elsif tree.right.nil?
                tmp = tree.left
                tree = nil
                return tmp
            else
                tmp = self.extract_minimum(tree.right)
                tree.data = tmp.data
                tree.right = self.delete_recursive(tree.right, tmp.data)
            end
        end

        if tree.nil?
            return tree
        end

        self.adjust_height(tree)
        balance = self.get_tree_balance(tree)
        left_balance = self.get_tree_balance(tree.left)
        right_balance = self.get_tree_balance(tree.right)

        if balance > 1 && left_balance >= 0
            return self.right_rotate(tree)
        elsif balance < - 1 && right_balance < 0
            return self.left_rotate(tree)
        elsif balance > 1 && left_balance < 0
            tree.left = self.left_rotate(tree.left)
            return self.right_rotate(tree)
        elsif balance < -1 && right_balance >= 0
            tree.right = right_rotation(tree.right)
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

    private :insert_recursive, :delete_recursive
end

