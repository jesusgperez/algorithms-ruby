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

    private :search_recursive
end
