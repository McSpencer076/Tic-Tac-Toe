module Testtactoe
  class Gameround
    WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], #horizontal line
                     [1, 4, 7], [2, 5, 8], [3, 6, 9], #vertical line
                     [1, 5, 9], [3, 5, 7]] #diagonal line

    def full_game
      while @round_number < @max_rounds
        play_round
      end
    end

    def initialize
      @board = Array.new(9, " ")
      @player_1_marks = []
      @player_2_marks = []
      @current_player = 1
      @round_number = 1
      @max_rounds = 9
    end

    def switch_player
      @current_player = (@current_player == 1) ? 2 : 1
    end

    def linecheck
      if WINNING_LINES.any? { |lines| (lines - @player_1_marks) == [] }
        puts "Player 1 Has Won This round"
        @player_1_score += 1
        return true
      elsif WINNING_LINES.any? { |lines| (lines - @player_2_marks) == [] }
        puts "Player 2 Has Won This round"
        @player_2_score += 1
        return true
      end
    end

    def play_round
      @player_1_score = 0
      @player_2_score = 0
      @winner_determined = false

      while !@winner_determined
        playingboard = Testtactoe::Playingboard.new
        puts playingboard.print_board(@board)
        place_mark
        if linecheck
          puts playingboard.print_board(@board)
          @board = Array.new(9, " ")
          @player_1_marks = []
          @player_2_marks = []
          @current_player = 1
          @winner_determined = true
          @round_number += 1
        end
      end
    end

    def place_mark
      @player_mark = (@current_player == 1) ? "X" : "O"
      @current_player_mark = (@current_player == 1) ? @player_1_marks : @player_2_marks
      loop do
        select_place_to_mark = rand(1..9)
        if @board[select_place_to_mark - 1] == " "
          @board[select_place_to_mark - 1] = @player_mark
          @current_player_mark << select_place_to_mark
          switch_player
          break
        end
      end
    end
  end

  def endgame
    if @player_1_score == 5
      puts "Player 1 is the winner!"
    elsif @player_2_score == 5
      puts "Player 2 is the winner!"
    end
  end

  class Playingboard
    def print_board(board)
      i = 0
      while (i < 3)
        j = 0
        while (j < 3)
          print "|" if (j < 3 && j != 0)
          print board[i * 3 + j] || " "
          j += 1
        end
        puts ""
        puts "-+-+-" if (i < 2)
        i += 1
      end
    end
  end
end

gameround = Testtactoe::Gameround.new
gameround.full_game
