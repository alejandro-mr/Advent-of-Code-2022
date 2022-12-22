# lib/supply_stacks.rb

class SupplyStacks
  def initialize
    @data = File.readlines('input.txt')
  end

  def part_one
    _stacks, _movements_line = parse_stacks
    moved_stacks = generate_movements(_stacks, _movements_line)
    _result = ''
    moved_stacks.each { |stack| _result += stack.last }
    _result
  end

  def part_two
    _stacks, _movements_line = parse_stacks
    moved_stacks = generate_movements_v2(_stacks, _movements_line)
    _result = ''
    moved_stacks.each { |stack| _result += stack.last }
    _result
  end

  private

  def generate_movements_v2(stacks, movements_line)
    @data[movements_line..].each do |movement|
      move = movement.scan(/\d+/)
      stacks[move[2].to_i - 1].concat(stacks[move[1].to_i - 1].pop(move[0].to_i))
    end
    stacks
  end

  def generate_movements(stacks, movements_line)
    @data[movements_line..].each do |movement|
      move = movement.scan(/\d+/)
      (1..move[0].to_i).each do |amount|
        stacks[move[2].to_i - 1].push(stacks[move[1].to_i - 1].pop())
      end
    end
    stacks
  end

  def parse_stacks
    # find the size of the stacks
    _stack_size = 0
    _stack_lines = 0
    @data.each do |line|
      if line.strip.match(/^[\d\s]+$/)
        _stack_size = line.chomp.strip[-1].to_i
        break
      end
      _stack_lines += 1
    end

    _stacks = Array.new(_stack_size) { Array.new }

    # find position in string where data is present
    _data_indexes = Array.new
    @data[_stack_lines].chars.each_with_index do |char, index|
      if char.match(/^\d{1}$/)
        _data_indexes.push(index)
      end
    end

    # fill the stacks with data
    @data[..._stack_lines].each do |line|
      _data_indexes.each_with_index do |position, index|
        if line[position] != ' '
          _stacks[index].unshift(line[position])
        end
      end
    end

    return _stacks, _stack_lines + 2
  end
end
