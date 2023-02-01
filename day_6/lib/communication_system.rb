# lib/communication_system.rb

# Day 6 solution implementation class
class CommunicationSystem
  def initialize
    @data = File.read('input.txt').chomp
  end

  def part_one
    solution
  end

  def part_two
    solution 14
  end

  def solution(length = 4)
    start_of_packet = []
    position = 0
    @data.split('').each_with_index do |c, i|
      position = i
      break if start_of_packet.length == length

      repeated = start_of_packet.index(c)
      start_of_packet = start_of_packet[repeated + 1..] if repeated&.integer?
      start_of_packet.push(c)
    end
    position
  end
end
