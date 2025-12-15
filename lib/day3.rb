class Multimeter

  def get_largest_joltage(bank)

  batteries = bank.chars.map(&:to_i)
  
  first_battery = batteries[0] 
  second_battery = batteries[1]

  batteries.each_cons(2) do |battery,next_battery|
    if (battery > first_battery) and not (next_battery.nil?) then
      first_battery = battery
      second_battery = next_battery
    elsif next_battery > second_battery then
      second_battery = next_battery
    end
  end

  first_battery*10 + second_battery

  end

  def total_joltage(input)
    total = 0
    banks = input.split("\n")
    banks.each do |bank|
      total += get_largest_joltage(bank)
    end

    total
  end
end

if __FILE__ == $0 
  multimeter = Multimeter.new
  path = File.join(__dir__, "day3input")
  content = File.read(path)
  puts multimeter.total_joltage(content)
end

