class Board
    def initialize
        @grid = Array.new(3) { Array.new(3, '_') }
    end

    def [](position)
        @grid[position.first][position.last]
    end

    def []=(position, val?)
        @grid[position.first][position.last] = val
    end

    def valid?(position)
        position.none? { |num| num < 0 || num > 2 }
    end

    def empty?(position)
        if self[position] == '_'
            return true
        else
            return false
        end
    end

    def place_mark(position, mark)
        if self.valid?(position) && self.empty?(position)
            self[pos] = mark
        else
            raise 'invalid mark'
        end
    end

    def print
        @grid.each { |row| puts row.join(" ") }
    end

    def win_row?(mark)
        return true if @grid.any? { |row| row.uniq.length == 1 }

        return false
    end

    def win_col?(mark)
        return true if @grid.transpose.any? { |col| col.uniq.length == 1 }

        return false
    end

    def win_diagonal?(mark)
        left_diagonal = []
        right_diagonal = []

        (0..@grid.length - 1).each do |i|
            left_diagonal << @grid[i][i]
            right_diagonal << @grid[i][@grid.length - 1 - i]
        end

        if left_diagonal.all?(mark) || right_diagonal.all?(mark)
            return true
        end

        return false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end
    
    def empty_positions?
        @grid.any? { |row| row.include?("_") }
    end
    
end