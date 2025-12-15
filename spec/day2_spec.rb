require "day2"

RSpec.describe InvalidIdChecker do
  let(:id_checker) {InvalidIdChecker.new}

  {
    1010 => true,
    99 => true,
    1188511885 => true,
    42 => false,
    1231234 => false,
    111 => true
  }.each do |value, expected|
    it "returns #{expected} for #{value}" do
      expect(id_checker.silly?(value)).to eq(expected)
    end
  end
  
  [
    {first: 11, last: 22, output: 33},
    {first: 95, last: 111, output: 210},
    {first: 998, last: 1012, output: 2009},
    {first:1188511880, last:1188511890, output:1188511885},
    {first:1698522, last:1698528, output: 0}
  ].each do |c|
    it "returns #{c[:output]} for #{c[:first]} and #{c[:last]}" do 
      invalid_ids = id_checker.verify_range(c[:first],c[:last])
      expect(invalid_ids).to eq(c[:output])
    end
  end
  
  it "can receive an 1d array" do
    input = "11-22,95-111,998-1012"
    invalid_ids = id_checker.verify_input(input)
    expect(invalid_ids).to eq(33+210+2009)
  end
end
