# lib/rucksack.rb

class Rucksack
  def initialize
    @data = File.readlines('input.txt')
    @priorities = [*'a'..'z', *'A'..'Z']
  end

  def part_one
    _sum = 0
    @data.each do |items|
      _dups = Hash.new(0)
      _first, _second = items.chomp.partition(/.{#{items.size / 2}}/)[1,2]

      _first.chars.each { |c| _dups.store(c.to_sym, 1) }
      _second.chars.uniq.each { |c| _dups.store(c.to_sym, _dups[c.to_sym] + 1) }

      _key = @priorities.index(_dups.key(2).to_s)
      _sum += _key.nil? ? 0 : _key + 1
    end
    _sum
  end

  def part_two
    _line = 0
    _dups = Hash.new(0)
    _sum = 0

    @data.each do |items|
      items.chomp.chars.uniq.each { |c| _dups.store(c.to_sym, _dups[c.to_sym] + 1) }

      _line += 1

      if _line == 3
        _sum += @priorities.index(_dups.key(3).to_s) + 1

        _line = 0
        _dups.clear
      end
    end
    _sum
  end
end
