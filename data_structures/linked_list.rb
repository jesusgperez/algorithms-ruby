require 'byebug'
require_relative 'domain'


class LinkedList
    attr_accessor :head, :tail

    def initialize(head = nil, tail = nil)
        @head = head
        @tail = tail
    end

    def insert(data)
        if @head.nil?
            @head = LNode.new(data=data)
            @tail = @head
            return
        end
        byebug

        @tail.next = LNode.new(data=data)
        @tail = @tail.next
        nil
    end
end
