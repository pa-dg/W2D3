class Board
    def initialize
        @grid = Array.new(3) {Array.new(3, '_')}
    end

    def [](pos)
        row, col = pos
        @grid[row][col] = pos
    end    

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end
    
    def valid?(pos)
        pos.none? { |i| i < 0 || i > @grid.length - 1 }
    end

    def empty?(pos)
        return self[pos] == '_'
    end
    
    def place_mark(pos, mark)
        if self.valid?(pos) || self.empty?(pos)
            self[pos] = mark
        else
            raise 'error - invalid position'
        end
    end

    def print
        return @grid.map { |row| puts row.join(" ") }
    end
    
    def win_row?(mark)
        return @grid.any? { |row| row.all?(mark) }
    end
    
    def win_col?(mark)
        return @grid.transpose.any? { |col| col.all?(mark) }
    end

    def win_diagonal?(mark)
        left_to_right = []
        right_to_left = []

        (0...@grid.length).each do |i|
            left_to_right << @grid[@grid.length - 1 - i][i]
            right_to_left << @grid[i][i]
        end

        return left_to_right.all?(mark) || right_to_left.all?(mark)
    end

    def win?(mark)
        return self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end
    
    def empty_positions?
        return @grid.any? { |row| row.include?('_') }
    end
    
end