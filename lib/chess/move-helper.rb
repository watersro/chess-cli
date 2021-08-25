module Move_helpers
  def legal_move?; end

  def x_axis(x)
    case x
    when 'a'
      0
    when 'b'
      1
    when 'c'
      2
    when 'd'
      3
    when 'e'
      4
    when 'f'
      5
    when 'g'
      6
    when 'h'
      7
    end
  end

  def y_axis(y)
    y -= 1
  end
end
