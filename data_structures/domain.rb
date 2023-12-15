class LNode
    attr_accessor :data, :next

    def initialize(data, next_value = nil)
        @data = data
        @next = next_value
    end
end

class DNode < LNode
    attr_accessor :previous

    def initialize(data, next_value = nil, previous = nil)
        super(data, next_value)
        @previous = previous
    end
end

TREE_TRAVERSE = {
    PREORDER: 10,
    INORDER: 20,
    POSTORDER: 30
}

HEAP_CHILD = {
    LEFT: 10,
    RIGHT: 20
}

class TreeNode
    attr_accessor :data, :left, :right

    def initialize(data, left = nil, right = nil)
        @data = data
        @left = left
        @right = right
    end
end

class AVLTreeNode < TreeNode
    attr_accessor :height

    def initialize(data, left = nil, right = nil, height = 1)
        super(data, left, right)
        @height = height
    end
end

class SegmentTreeNode < TreeNode
    attr_accessor :indexes

    def initialize(data = nil, left = nil, right = nil, indexes)
        super(data, left, right)
        @indexes = indexes
    end
end
