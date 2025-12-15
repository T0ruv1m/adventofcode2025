require "day3"

RSpec.describe Multimeter do

  {
    '987654321111111' => 98,
    '811111111111119' => 89,
    '234234234234278' => 78,
    '818181911112111' => 92
  }.each do |value,expected|
    it "a bank consisting in #{value} should have the joltage of #{expected}" do
     multimeter = Multimeter.new
     expect(multimeter.get_largest_joltage(value)).to eq(expected)
    end
  end

 it "analyses a multiline input text" do
   input = "987654321111111
            811111111111119
            234234234234278
            818181911112111"
   multimeter = Multimeter.new
   expect(multimeter.total_joltage(input)).to eq(357)
  end
end


