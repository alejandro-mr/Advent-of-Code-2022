# lib/elf_strategy.rb

class ElfStrategy
  def initialize
    @data = File.readlines("input.txt")
    @points_matrix = {
      a: {
        x: 1 + 3,
        y: 2 + 6,
        z: 3 + 0,
      },
      b: {
        x: 1 + 0,
        y: 2 + 3,
        z: 3 + 6,
      },
      c: {
        x: 1 + 6,
        y: 2 + 0,
        z: 3 + 3,
      },
    }

    @moves_matrix = {
      a: {
        x: 3 + 0,
        y: 1 + 3,
        z: 2 + 6,
      },
      b: {
        x: 1 + 0,
        y: 2 + 3,
        z: 3 + 6,
      },
      c: {
        x: 2 + 0,
        y: 3 + 3,
        z: 1 + 6,
      },
    }
  end

  def winner(move_a, move_b)
    @points_matrix[move_a.downcase.to_sym][move_b.downcase.to_sym]
  end

  def winner_moves(move_a, move_b)
    @moves_matrix[move_a.downcase.to_sym][move_b.downcase.to_sym]
  end

  def part_one
    _points = 0
    @data.each do |play|
      _points += winner(play.chomp[0], play.chomp[2])
    end
    _points
  end

  def part_two
    _points = 0
    @data.each do |play|
      _points += winner_moves(play.chomp[0], play.chomp[2])
    end
    _points
  end
end
