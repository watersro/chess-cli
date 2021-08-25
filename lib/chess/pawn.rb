# Pawns can only move forward one space unless:
# - it's their first turn(they move two spaces)
# - there is a piece they can take diagonally "in front" of them(they can move and take that piece)
# - they are blocked in front of them by another piece
# - they are at the end of the board
# If at the end of the board:
# - They can become a Knight/Bishop/Rook/Queen

# If board piece in front empty
# move forward
# else say

class Pawn
  attr_reader :color

  def initialize(color)
    @color = color
  end
end
