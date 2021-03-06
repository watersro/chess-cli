# frozen_string_literal: true

require_relative 'pawn'
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'queen'
require_relative 'king'
require_relative 'move-helper'

# Class that describes the game board
class Board
  include Move_helpers
  attr_accessor :chess_board

  def initialize
    @chess_board = Array.new(8) { Array.new(8) }
    @set_up = set_up_board
  end

  def set_up_board
    0.upto(7) do |i|
      @chess_board[i][1] = Pawn.new('white')
      @chess_board[i][6] = Pawn.new('black')
    end
    place_rook
    place_bishop
    place_knight
    place_queen
    place_king
  end

  def display_board
    print_helper_top
    8.times do |x|
      y = 0
      print "\n"
      alph = %w[a b c d e f g h]
      print "(#{alph[x]}) "

      while y < 8
        if @chess_board[x][y].nil?
          print '|   |'
        else
          print "| #{print_piece(x, y)} |"
        end
        y += 1
      end
      print_helper_bottom
    end
    print "\n"
  end

  def move_piece(coord)
    coord_array = coord.split('')
    coord_array[1] = coord_array[1].to_i
    x = x_axis(coord_array[0])
    y = y_axis(coord_array[1])
    @chess_board[x][y] = nil
    # p coord_array if coord_array[0].between?('a', 'h') && coord_array[1].between?(1, 8)
  end

  private

  def place_rook
    @chess_board[0][0] = Rook.new('white')
    @chess_board[7][0] = Rook.new('white')
    @chess_board[0][7] = Rook.new('black')
    @chess_board[7][7] = Rook.new('black')
  end

  def place_knight
    @chess_board[1][0] = Knight.new('white')
    @chess_board[6][0] = Knight.new('white')
    @chess_board[1][7] = Knight.new('black')
    @chess_board[6][7] = Knight.new('black')
  end

  def place_bishop
    @chess_board[2][0] = Bishop.new('white')
    @chess_board[5][0] = Bishop.new('white')
    @chess_board[2][7] = Bishop.new('black')
    @chess_board[5][7] = Bishop.new('black')
  end

  def place_queen
    @chess_board[3][0] = Queen.new('white')
    @chess_board[3][7] = Queen.new('black')
  end

  def place_king
    @chess_board[4][0] = King.new('white')
    @chess_board[4][7] = King.new('black')
  end

  def print_piece(x, y)
    if @chess_board[x][y].color == 'white'
      print_white(x, y)
    else
      print_black(x, y)
    end
  end

  def print_white(x, y)
    return 'P' if @chess_board[x][y].instance_of?(Pawn) && @chess_board[x][y].color == 'white'
    return 'R' if @chess_board[x][y].instance_of?(Rook) && @chess_board[x][y].color == 'white'
    return 'B' if @chess_board[x][y].instance_of?(Bishop) && @chess_board[x][y].color == 'white'
    return 'N' if @chess_board[x][y].instance_of?(Knight) && @chess_board[x][y].color == 'white'
    return 'Q' if @chess_board[x][y].instance_of?(Queen) && @chess_board[x][y].color == 'white'
    return 'K' if @chess_board[x][y].instance_of?(King) && @chess_board[x][y].color == 'white'
  end

  def print_black(x, y)
    return 'p' if @chess_board[x][y].instance_of?(Pawn) && @chess_board[x][y].color == 'black'
    return 'r' if @chess_board[x][y].instance_of?(Rook) && @chess_board[x][y].color == 'black'
    return 'b' if @chess_board[x][y].instance_of?(Bishop) && @chess_board[x][y].color == 'black'
    return 'n' if @chess_board[x][y].instance_of?(Knight) && @chess_board[x][y].color == 'black'
    return 'q' if @chess_board[x][y].instance_of?(Queen) && @chess_board[x][y].color == 'black'
    return 'k' if @chess_board[x][y].instance_of?(King) && @chess_board[x][y].color == 'black'
  end

  def print_helper_top
    print '    '
    (1..8).each { |num| print " (#{num}) " }
    print "\n"
    print '    '
    8.times { print '-----' }
  end

  def print_helper_bottom
    print "\n"
    print '    '
    8.times { print '-----' }
  end
end

test = Board.new
# p test.chess_board
test.display_board
test.move_piece('a1')
test.display_board
