module Mastermind
    
    $colors = ["red", "blue", "white", "green", "black", "orange"]

    $code_breaker = []

    $code_maker = []

    $round = nil

    $white_data = []
    $red_data = []

    class Game
        @@makeorguess = 0
        def initialize(player_1, player_2, makeorguess)
            @player_1 = player_1.new()
            @player_2 = player_2.new()
            @@makeorguess = makeorguess
        end
            

        def play 
            game = 0
            if @@makeorguess == 1    
                code_make
                while (game < 12) do
                    if $code_maker == $code_breaker
                        puts "Player 1 wins"
                        game = 100
                    elsif game > 0 
                    verify_order_and_color
                    puts "hint, red pegs: #{$red_peg} white pegs: #{$white_peg}"
                    $red_peg = 0
                    $white_peg = 0
                    end
                    if game != 100
                        code_guess
                        game +=1
                    end
                end
            elsif @@makeorguess == 2
                code_make
                while (game < 12) do
                    if $code_maker == $code_breaker
                        puts "Player 1 wins"
                        game = 100
                    elsif game > 0 
                    verify_order_and_color
                    puts "hint, red pegs: #{$red_peg} white pegs: #{$white_peg}"
                    $red_peg = 0
                    $white_peg = 0
                    end
                    if game != 100
                        code_guess 
                        game +=1
                    end
                end
            end

        end

        def code_guess
            if @@makeorguess == 1    
                puts "Guess the colors"
                color_1 = gets.chomp
                color_2 = gets.chomp
                color_3 = gets.chomp
                color_4 = gets.chomp

                $code_breaker = [color_1, color_2, color_3, color_4]
            elsif @@makeorguess == 2
                if $red_data.length != 0 || $white_data.length != 0
                    $code_breaker << $red_data
                    $code_breaker << $white_data
                    $code_breaker.uniq
                    $red_data = []
                    $white_data = []
                elsif $red_data.length == 0 || $white_data.length == 0
                    $code_breaker = $colors.sample(4)
                end
                

            end
        end

        def code_make 
            if @@makeorguess == 1
                $code_maker = $colors.sample(4)
            elsif @@makeorguess == 2
                puts "Make the code"
                color_1 = gets.chomp
                color_2 = gets.chomp
                color_3 = gets.chomp
                color_4 = gets.chomp

                $code_maker = [color_1, color_2, color_3, color_4]
            end
        end



        def verify_order_and_color
            $red_peg = 0
            $white_peg = 0
            
            i = 0
            $code_breaker.each do |elem|
                if $code_maker.any?(elem) && elem != $code_maker[i]
                    $white_peg += 1
                    $white_data << elem
                    i += 1
                    
                elsif $code_maker.any?(elem) && elem == $code_maker[i]
                    $red_peg += 1
                    $red_data << elem
                    i += 1
                end 
            end
            $round = 1
           
        end

       

       
    end

    class Player
       
    end

    class HumanPlayer < Player
        puts "#{$colors}"
    end
    class ComputerPlayer < Player
       
    end

end

include Mastermind

print "Type 1 to be guesser or Type 2 to create the code: "
playerOne = ""
until (playerOne == 1 || playerOne == 2)
    playerOne = gets.chomp.to_i
    
end



Game.new(HumanPlayer, ComputerPlayer, playerOne).play