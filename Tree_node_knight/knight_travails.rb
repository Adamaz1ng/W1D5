
class KnightPathFinder
  KNIGHT_MOVES = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-2, 1], [-1, 2], [2, -1]]

  attr_accessor :start_pos

  def self.valid_moves(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7) ? true : false
  end

  def initialize(coord)
    @start_pos = coord
    @visited_positions = [coord]
    @move_tree
  end

  def find_moves(current_pos)
    move_set = []
    KNIGHT_MOVES.each do |arr|
      move = [arr[0] + current_pos[0], arr[1] + current_pos[1]]
      if KnightPathFinder.valid_moves(move)
        move_set << moves
      end
    end
    return move_set
  end

  def new_move_position(pos)
    filtered_moves = self.find_moves(pos).reject { |move| @visited_positions.include?(move) }
    updated_moves = filtered_moves.each { |move| @visited_positions << move }
    updated_moves
  end

  def build_move_tree
    queue = [@start_pos]
    until queue.empty?
      current_node = queue.shift
      path_tree << current_node
      queue += new_move_position(pos)
    end
    @move_tree
  end

end
