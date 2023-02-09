# lib/camp_cleanup.rb

class CampCleanup
  def initialize
    @data = File.readlines('input.txt')
  end

  def part_one
    _total = 0
    @data.each do |groups|
      a, b = groups.split(',')
      firstA, lastA = a.split('-')
      firstB, lastB = b.split('-')

      rangeA = (firstA.to_i..lastA.to_i)
      rangeB = (firstB.to_i..lastB.to_i)

      if rangeA.cover?(rangeB) || rangeB.cover?(rangeA)
        _total += 1
      end
    end
    _total
  end

  def part_two
    _total = 0
    @data.each do |groups|
      a, b = groups.split(',')
      firstA, lastA = a.split('-')
      firstB, lastB = b.split('-')

      if !(firstA.to_i > lastB.to_i || lastA.to_i < firstB.to_i)
        _total += 1
      end
    end
    _total
  end
end
