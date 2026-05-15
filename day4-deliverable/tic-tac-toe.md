### Tic-Tac-Toe Game Specifics

The `module TicTacToe` wraps the entire game in a box and this game uses two (2) classes:
**Game** - manages game rules
**Player** - manages player interactions

`LINES` is a constant array that includes all possible winning combinations.

#### Game Class
The `Game` class has the following methods:
* `initialize` - sets up the game board and initializes player instances.
* `play` - main game loop that continues until the game is over.
* `free_positions` - returns an array of available positions on the board.
* `place_player_marker` - places the player's marker on the board at the specified position.
* `player_has_won?` - checks if the current player has won the game.
* `board_full?` - checks if the game board is full, indicating a draw.
* `switch_players!` - switches the current player after each turn.
* `current_player` - returns the current player instance.
* `print_board` - prints the current state of the game board.

#### Player Class
* `attr_reader :marker, :name` - allows access to the player's marker and name.
* `select_position!` - prompts the player to select a position on the board and validates the input.
The `HumanPlayer` class inherits from `Player` and implements the `select_position!` method to allow human players to choose their moves.

