require_relative 'domain'


class CountTree
    attr_accessor :n, :root

    def initialize(low, high)
        @n = 0
        @root = self.build(low, high)
    end

    def build(low, high)
        node = SegmentTreeNode.new(indexes=[low, high])

        @n += 1

        if low == high
            return node
        end

        mid = (low + high) / 2

        node.left = self.build(low, mid)
        node.right = self.build(mid + 1, high)
        node
    end

    def update(index)
        update_recursive(@root, index)
    end

    def update_recursive(tree, index)
        if tree.nil?
            return
        end

        low, high = tree.indexes

        if low == index && high == index
            tree.data = 1 + self.get_tree_data(tree)
            return
        end

        mid = (low + high) / 2

        if index <= mid
            self.update_recursive(tree.left, index)
        else
            self.update_recursive(tree.right, index)
        end
        tree.data = self.get_tree_data(tree.left) + self.get_tree_data(tree.right)
    end

    def get_sum_range(low, high)
        get_sum_range_recursive(@root, low, high)
    end

    def get_sum_range_recursive(tree, low, high)
        if tree.nil?
            return 0
        end

        tree_low, tree_high = tree.indexes

        if tree_low == low && tree_high == high
            return self.get_tree_data(tree)
        end

        mid = (tree_high + tree_low) / 2

        if high <= mid
            return self.get_sum_range_recursive(tree.left, low, high)
        elsif low >= mid + 1
            return self.get_sum_range_recursive(tree.right, low, high)
        end

        left_sum = self.get_sum_range_recursive(tree.left, low, mid)
        right_sum = self.get_sum_range_recursive(tree.right, mid + 1, high)

        return left_sum + right_sum
    end

    def get_tree_data(tree)
        if tree.nil? || tree.data.nil?
            return 0
        end

        tree.data
    end

    private :update_recursive, :build, :get_sum_range_recursive
end
