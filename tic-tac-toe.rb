module TicTacToe
  class Game
    def initialize()
      @player_1_score = 0
      @player_2_score = 0
      @round_number = 0
      @current_player = 1
      @board = Array.new(10)
      @player_1_marks = []
      @player_2_marks = []
    end

    def winning_lines
      horizontal_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      vertical_lines = [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
      diagonal_lines = [[1, 5, 9], [3, 5, 7]]

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
      player_mark = (@current_player == 1) ? "X" : "O"
      loop do
        select_place_to_mark = rand(1..9)
        if @board[select_place_to_mark].nil?
          @board[select_place_to_mark] = player_mark
          current_player_marks = (@current_player == 1) ? @player_1_marks : @player_2_marks
          current_player_marks << select_place_to_mark
          break
        end
      end
      if linecheck
        @current_player == 1 ? @player_1_score += 1 : @player_2_score += 1
        puts "#{@current_player} has won this round."
        puts "Player 1: #{@player_1_score}, Player 2: #{@player_2_score}, Round: #{@round_number}"
        @round_number += 1
      else
        switch_player
        @round_number += 1
      end
    end

  end

  class Board
  end

  class HumanPlayer
  end

  class ComputerPlayer
  end
end
