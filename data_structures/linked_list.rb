require_relative 'domain'


class LinkedList
    attr_reader :head, :tail, :n
    
    def initialize(head = nil, tail = nil)
        @head = head
        @tail = tail
        @n = 0
    end

    def insert(data)
        if @head.nil?
            @head = LNode.new(data=data)
            @tail = @head
            @n += 1
            return
        end

        @tail.next = LNode.new(data=data)
        @tail = @tail.next
        @n += 1
        nil
    end

    def search(data)
        search_recursive(@head, data)
    end

    def search_recursive(node, data)
        if node.nil? || node.data == data
            return node
        end

        search_recursive(node.next, data)
    end


    def delete(data)
        delete_recursive(@head, data)
    end

    def delete_recursive(node, data)
        if node.nil? || node.next.nil?
            return nil
        end

        if node.next.data == data
            tmp = node.next.data
            node.next = node.next.next
            @n -= 1
            return tmp
        end

        delete_recursive(node.next, data)
    end

    def has_cycle(node, set = nil)
        if node.nil?
            return false
        end

        if set.nil?
            set = Set.new
        end

        if set.include?(node)
            return true
        end

        set << node

        has_cycle(node.next, set)
    end

    private :search_recursive, :delete_recursive
end
