class Piece
  include Comparable

  def <=>(other_piece)
    raise 'this method should be overridden'
  end

end

class Rock < Piece
  def <=>(other_piece)
    case other_piece
    when Rock then
      0
    when Paper then
      1
    when Scissors then
      -1
    end
  end

  def to_s
    "Rock"
  end
end

class Paper < Piece
  def <=>(other_piece)
    case other_piece
    when Rock then
      -1
    when Paper then
      0
    when Scissors then
      1
    end
  end

  def to_s
    "Paper"
  end
end

class Scissors < Piece
  def <=>(other_piece)
    case other_piece
    when Rock then
      1
    when Paper then
      -1
    when Scissors then
      0
    end
  end

  def to_s
    "Scissors"
  end
end
