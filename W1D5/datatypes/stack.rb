class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack.push(el)
    end

    def pop
        return @stack.pop
    end

    def peek
        return @stack[-1]
    end
end