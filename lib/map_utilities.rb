module MapUtilities

  private

  def nearer_boxes(x, y)
    [
      top_left_box(x, y),
      top_box(x, y),
      top_right_box(x, y),
      right_box(x, y),
      right_bottom_box(x, y),
      bottom_box(x, y),
      left_bottom_box(x, y),
      left_box(x, y)
    ]
  end

  def left_box(x, y)
    [x, y - 1]
  end

  def left_bottom_box(x, y)
    [x + 1, y - 1]
  end

  def bottom_box(x, y)
    [x + 1, y]
  end

  def right_bottom_box(x, y)
    [x + 1, y + 1]
  end

  def right_box(x, y)
    [x, y + 1]
  end

  def top_right_box(x, y)
    [x - 1, y + 1]
  end

  def top_box(x, y)
    [x - 1, y]
  end

  def top_left_box(x, y)
    [x - 1, y - 1]
  end
end
