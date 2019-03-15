class Map
    def initialize
        @map = []
    end

    def set(key, value)
        found = false
        @map.each_with_index do |el, i|
            if el[0] == key
                @map[i][1] = value
                found = true
            end
        end
        @map.push([key, value]) if !found
    end

    def get(key)
        @map.each do |el|
            return el[1] if el[0] == key
        end
        return nil
    end

    def delete(key)
        @map.each do |el|
            if el[0] == key
                value = el[1] 
                @map.delete([key, value])
            end
        end
    end

    def show
        @map
    end
end