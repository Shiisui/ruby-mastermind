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
            game = 0
            while (game < 12) do
                if $computer_colors_code == $user_color_input
                    puts "Player 1 wins"
                    game = 100
                elsif game > 0 
                   verify_order_and_color
                   puts "hint, red pegs: #{$red_peg} white pegs: #{$white_peg}"
                   $red_peg = 0
                   $white_peg = 0
                end
                if game != 100
                    humanPlay 
                    game +=1
                end
            end
        end

        def humanPlay 
            puts "Guess the colors"
            color_1 = gets.chomp
            color_2 = gets.chomp
            color_3 = gets.chomp
            color_4 = gets.chomp

            $user_color_input = [color_1, color_2, color_3, color_4]
        end

        def verify_order_and_color
            $red_peg = 0
            $white_peg = 0
            i = 0
            $user_color_input.each do |elem|
                if $computer_colors_code.any?(elem) && elem != $computer_colors_code[i]
                    $white_peg += 1
                    i += 1
                
                elsif $computer_colors_code.any?(elem) && elem == $computer_colors_code[i]
                    $red_peg += 1
                    i += 1
                end 
            end
        end

       
    end

    class Player
       
    end

    class HumanPlayer < Player
        puts "Choice between colors #{$colors}"
    end
    class ComputerPlayer < Player
       
        $computer_colors_code = $colors.sample(4)
           
        p $computer_colors_code
       
    end

end

include Mastermind

Game.new(HumanPlayer, ComputerPlayer).play