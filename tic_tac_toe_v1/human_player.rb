class HumanPlayer
    def initialize(val)
        @mark = val
    end

    def mark
        @mark
    end

    def get_position
        puts "Player #{@mark.to_s}, enter your position as two numbers with a space in between to represent the format `row col`"
        position = gets.chomp.split(" ").map(&:to_i)

        if position.length != 2
            raise 'error - invalid position, try again'
        else
            position
        end
    end
end