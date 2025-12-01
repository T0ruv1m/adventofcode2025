require "day1"

RSpec.describe Dial do

  it "receives R inputs" do
    dial = Dial.new(5)
    dial.move('R20')
    expect(dial.position).to eq(25) 
  end

  it "receives L inputs" do
    dial = Dial.new(5)
    dial.move('L3')
    expect(dial.position).to eq(2)
  end

  it "is circular" do
    dial = Dial.new(5)
    dial.move('L100')
    expect(dial.position).to eq(5)
  end

  it "works for more than one period moves" do
    dial = Dial.new(5)
    dial.move('L200')
    expect(dial.position).to eq(5)
  end

  it "counts password when end on zero" do
    dial = Dial.new(5)
    dial.move('L5')
    expect(dial.password).to eq(1)
  end
  
  it "counts password when crosses zero" do
    dial = Dial.new(5)
    dial.move('L10')
    expect(dial.password).to eq(1)
  end

  it "password is equal to the number of times it clicks on zero" do 
    attachment =
    "L68 \n" +
    "L30 \n" +
    "R48 \n" +
    "L5  \n" + 
    "R60 \n" +
    "L55 \n" +
    "L1 \n" +
    "L99 \n" +
    "R14 \n" +
    "L82 \n"
    dial = Dial.new(50)
    dial.calculate_psswrd(attachment)
    expect(dial.password).to eq(6)
  end

end
