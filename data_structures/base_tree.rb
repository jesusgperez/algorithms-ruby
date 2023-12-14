require_relative 'domain'


class BaseTree
    attr_reader :n
    attr_accessor :root
    def initialize
        @@root = nil
        @@n = 0
    end

    def search(data)
        search_recursive(@root, data)
    end

    def search_recursive(tree, data)
        if tree.nil?
            return tree
        end

        if data < tree.data
            return search_recursive(tree.left, data)
        elsif data > tree.data
            return search_recursive(tree.right, data)
        end

        return tree
    end

    def traverse(traverse = tree_traverse[:INORDER])
        traverse_recursive(@root, traverse)
    end

    def traverse_recursive(tree, traverse, list = [])
        if tree.nil?
            return list
        end

        if traverse == tree_traverse[:PREORDER]
            list.append(tree.data)
            list = traverse_recursive(tree.left, traverse, list)
            list = traverse_recursive(tree.right, traverse, list)
        elsif traverse == tree_traverse[:INORDER]
            list = traverse_recursive(tree.left, traverse, list)
            list.append(tree.data)
            list = traverse_recursive(tree.right, traverse, list)
        else
            list = traverse_recursive(tree.left, traverse, list)
            list = traverse_recursive(tree.right, traverse, list)
            list.append(tree.data)
        end

        return list
    end

    private :search_recursive, :traverse_recursive

end
