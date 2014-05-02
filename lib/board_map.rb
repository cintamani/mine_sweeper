require_relative 'map_utilities'

class BoardMap
  include MapUtilities

  BOMB_CHAR  = '*'
  EMPTY_CHAR = '.'

  def initialize(size, mines)
    @size = size
    add_mines(mines)
  end

  def to_s
    map.map { |row| row.join }.join("\n") + "\n"
  end

  private

  attr_reader :size

  def add_mines(positions)
    positions.each do |position|
      y, x = *position
      add_mine(x, y) if x_y_in_map?(x, y)
    end
  end

  def add_mine(x, y)
    map[x][y] = BOMB_CHAR
    add_counters(nearer_boxes(x, y))
  end

  def add_counters(boxes)
    boxes.each do |box|
      x, y = *box

      if valid_box?(x, y)
        map[x][y] = map[x][y] == EMPTY_CHAR ? 1 : map[x][y] + 1
      end
    end
  end

  def valid_box?(x, y)
    x_y_in_map?(x, y) && !bomb_box?(x, y)
  end

  def bomb_box?(x, y)
    map[x][y] == BOMB_CHAR
  end

  def x_y_in_map?(x, y)
    x < size && y < size
  end

  def map
    @map ||= size.times.map { size.times.map { EMPTY_CHAR } }
  end
end
