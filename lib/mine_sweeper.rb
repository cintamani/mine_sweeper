require 'yaml'
require_relative 'board_map'

class MineSweeper

  BOARDS_FILE = 'boards.yml'

  def initialize(level)
    raise ArgumentError unless board_types.include?(level)

    @level = level
  end

  def render(output)
    output.write(board_map.to_s)

    output
  end

  private

  attr_reader :level

  def board_map
    @board_map ||= BoardMap.new(size, mines)
  end

  def size
    config['size']
  end

  def mines
    config['mines']
  end

  def board_types
    configs.map { |item| item['type'] }
  end

  def config
    @config ||= configs.find do |config|
      config['type'] == level
    end
  end

  def configs
    @configs ||= YAML.load_file(BOARDS_FILE)
  end
end
