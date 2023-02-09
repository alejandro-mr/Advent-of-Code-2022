#!/usr/bin/env ruby

class ElfCalories
  def initialize()
    @data = File.readlines("input.txt")
    @elfs = Array.new
    elfs_calories
  end

  def part_one
    puts @elfs.max
  end

  def part_two
    puts @elfs.max(3).sum
  end

  private

  def elfs_calories
    _currentElf = 0
    @data.each do |calories|
      if calories == "\n"
        _currentElf += 1
        next
      else
         @elfs[_currentElf] = @elfs[_currentElf].to_i + calories.to_i
      end
    end
  end
end
