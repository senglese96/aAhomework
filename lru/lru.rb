class LRUCache
    def initialize(limit)
        @limit = limit
        @store = []
    end

    def count
        return @store.length
    end

    def add(el)
        if store.include?(el)
            add_dup(el)
        else
            @store << el
            @store.shift if count > @limit
        end
    end

    def show
        p @store
    end

    private
    def add_dup(el)
        @store.delete(el)
        @store << el
    end
end
