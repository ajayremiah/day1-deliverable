# Credits to: https://rosettacode.org/wiki/Tic-tac-toe#Ruby for the original code, which has been modified to make two human players play against each other instead of a human vs computer.

module TicTacToe
  # winning combinations
  LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

  class Game
    attr_reader :board, :current_player_id

    def initialize(player_1_class, player_2_class)
      @board = Array.new(10) # index 0 ignored for 1-9 positioning
      @current_player_id = 0

      # this initializes two human players to play against each other
      @players = [
        player_1_class.new(self, "X", "Player 1"), 
        player_2_class.new(self, "O", "Player 2")
      ]
      puts "\n----- WELCOME TO TIC-TAC-TOE! -----"
      puts "#{current_player} goes first.\n"
    end

    def play
      loop do
        place_player_marker(current_player)
        
        if player_has_won?(current_player)
          print_board
          puts "\nGame Over: #{current_player} (#{current_player.marker}) wins!"
          return
        elsif board_full?
          print_board
          puts "\nGame Over: It's a draw!"
          return
        end

        switch_players!
      end
    end

    def free_positions
      (1..9).select { |position| @board[position].nil? }
    end

    def place_player_marker(player)
      position = player.select_position!
      @board[position] = player.marker
    end

    def player_has_won?(player)
      LINES.any? do |line|
        line.all? { |position| @board[position] == player.marker }
      end
    end

    def board_full?
      free_positions.empty?
    end

    def switch_players!
      @current_player_id = 1 - @current_player_id
    end

    def current_player
      @players[@current_player_id]
    end

    def print_board
      col_separator, row_separator = " | ", "--+---+--"
      
      label_for_position = lambda { |position| @board[position] ? @board[position] : position }
      row_for_display = lambda { |row| row.map(&label_for_position).join(col_separator) }
      
      row_positions = [[1,2,3], [4,5,6], [7,8,9]]
      rows_for_display = row_positions.map(&row_for_display)
      
      puts "\n" + rows_for_display.join("\n" + row_separator + "\n") + "\n"
    end
  end

  class Player
    attr_reader :marker, :name
    def initialize(game, marker, name)
      @game = game
      @marker = marker
      @name = name
    end

    def to_s
      @name
    end
  end

  class HumanPlayer < Player
    def select_position!
      @game.print_board
      loop do
        print "#{name} (#{marker}), select a position: "
        selection = gets.chomp.to_i
        return selection if @game.free_positions.include?(selection)
        puts "Invalid move. Please choose an available number from the board."
      end
    end
  end
end

# starts the game with two human players:
TicTacToe::Game.new(TicTacToe::HumanPlayer, TicTacToe::HumanPlayer).play