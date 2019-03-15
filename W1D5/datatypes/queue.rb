class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        return @queue.shift
    end

    def peek
        return @queue[0]
    end
end