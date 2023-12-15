require_relative '../data_structures/avl_tree'


DEFAULT = 1

class Bin < AVLTree
    def initialize(capacity = DEFAULT)
        super()
        @capacity = capacity
    end

    def pack(weight)
        tree = best_fit(@root, weight)

        if tree
            tmp = tree.data
            self.delete(tmp)
            self.insert(tmp + weight)
        else
            self.insert(weight)
        end
    end

    def best_fit(tree, weight)
        if tree.nil?
            return tree
        end

        if @capacity >= tree.data + weight
            better = self.best_fit(tree.right, weight)
            return better.nil? ? tree : better 
        end

        self.best_fit(tree.left, weight)
    end

end
