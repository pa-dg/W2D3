class HumanPlayer
    attr_reader :mark_val
    
    def initialize(mark_val)
        @mark_val = mark_val
    end

    def get_position
        puts "Enter your position, Player #{mark_val.to_s}, as two numbers with a space betweem them representing position in the format `0 0` as `row col`"
        input = gets.chomp.split(" ").map(&:to_i)
        raise "invalid input" if input.length != 2

        return input
    end
end