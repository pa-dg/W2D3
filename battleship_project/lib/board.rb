class Board
    attr_reader :size
    
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N)}
        @size = (n * n)
    end

    def size
        @size
    end

    def [](position) #[2,4] [row, column]
        @grid[position.first][position.last] 
    end
    
    def []= (pos, val)
        @grid[pos.first][pos.last] = val
    end
    
    def num_ships
        @grid.flatten.count { |val| val == :S }
    end
    
    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts "you sunk my battleship"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        
        while self.num_ships < (@size * 0.25)
            random_row = rand(0...@grid.length)
            random_col = rand(0...@grid.length) 
            position = [random_row, random_col]
            self[position] = :S
        end

    end

    def hidden_ships_grid
        return @grid.map { |inner_grid| 
            inner_grid.map { |val| val == :S ? val = :N : val }}
    end    

    def self.print_grid(grid)
        grid.each { |inner_grid| puts inner_grid.join(" ") }

    end
    
    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
    
end
