module Mastermind
    
    $colors = ["red", "blue", "white", "green", "black", "orange"]

    $code_breaker = []

    $code_maker = []

    $k = 0

    $no_match_data = []
  

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
                        puts "win red pegs: 4 white pegs: 0"
                        p $code_breaker
                        game = 100
                    elsif game > 0 
                    verify_order_and_color
                    puts "hint, red pegs: #{$red_peg} white pegs: #{$white_peg}"
                   
                    end
                    if game != 100
                        code_guess
                        game +=1
                    end
                end
            elsif @@makeorguess == 2
                code_make
                while (game < 13) do
                    if $code_maker == $code_breaker
                        puts "Player 1 wins"
                        puts "win red pegs: 4 white pegs: 0"
                        p $code_breaker
                        game = 100
                    elsif game > 0 
                    verify_order_and_color
                    puts "hint, red pegs: #{$red_peg} white pegs: #{$white_peg}"
                    
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
               
                if $k == 0
                    $code_breaker = $colors.sample(4)
                elsif $white_peg == 4 || $white_peg == 3 && $red_peg == 1 || $white_peg == 2 && $red_peg == 2 || $red_peg == 3 && $white_peg == 1
                    $code_breaker = $code_breaker.shuffle
                    $k = 1
                end
                    $colors = $colors - $no_match_data
                    
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
            $no_match = 0
            i = 0
            $code_breaker.each do |elem|
                if $code_maker.any?(elem) && elem != $code_maker[i]
                    $white_peg += 1
                    i += 1
                    
                elsif $code_maker.any?(elem) && elem == $code_maker[i]
                    $red_peg += 1
                    i += 1
                else 
                    $no_match_data << elem
                    $no_match +=1
                end
            end
            
            
           
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