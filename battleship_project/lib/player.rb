class Player
    attr_reader :get_move

    def get_move
        puts "enter a position with coordinates separated with a space lile `4 7`"
        input = gets.chomp.split(" ").map(&:to_i)
        
        return input
    end

end
