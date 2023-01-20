module TicTacToe

    class Game
        def initialize()
            player_1_score = 0
            player_2_score = 0
            round_number = 0
            @current_player = 1

            @board = Array.new(10)
            
            @player_1_marks = []
            @player_2_marks = []

        end

        def winning_lines
            horizontal_lines = [[1,2,3], [4,5,6], [7,8,9]]
            vertical_lines = [[1,4,7], [2,5,8], [3,6,9]]
            diagonal_lines = [[1,5,9], [3,5,7]]

            @winning_lines = [vertical_lines, horizontal_lines, diagonal_lines]
        end

        def switch_player
            @current_player = (@current_player == 1) ? 2 : 1
        end        

        def linecheck
            current_player_marks = (@current_player == 1) ? @player_1_marks : @player_2_marks
            @winning_lines.each do |line|
                if (line - current_player_marks).empty?
                    return true
                end
            end
            return false
        end

        def playround
            
        end

        def resetboard
            #remove all O and X from board
        end

        def endround
            puts "#{@current_player} has won this round!"
            puts board
            puts score
        end

        def endgame
            puts "#{@current_player} has won this round!"
            puts score
            puts "#{@current_player} has won the game!"
        end

    end

    class Board

    end

    class HumanPlayer

    end

    class ComputerPlayer

    end

end

