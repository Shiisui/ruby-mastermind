module Mastermind
    
    $colors = ["red", "blue", "white", "green", "black", "orange"]

    

    $user_color_input = []

    $computer_colors_code = []

    class Game
        def initialize(player_1, player_2)
            @player_1 = player_1.new()
            @player_2 = player_2.new()
        end
        def play 
            if $computer_colors_code == $user_color_input
                puts "Player 1 wins"
            else
                puts "wait"
            end
        end
        
    end

    class Player
        
    end

    class HumanPlayer < Player

        puts "I'am a human i have choice between colors #{$colors}"
        puts "Guess the colors"
        color_1 = gets.chomp
        color_2 = gets.chomp
        color_3 = gets.chomp
        color_4 = gets.chomp

        $user_color_input = [color_1, color_2, color_3, color_4]
    end
    class ComputerPlayer < Player
        puts "Me computer i have choice between colors #{$colors}"

        $computer_colors_code = ["red", "white", "green", "orange"]

    end

end

include Mastermind

Game.new(HumanPlayer, ComputerPlayer).play