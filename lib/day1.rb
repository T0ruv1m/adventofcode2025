class Dial
  attr_accessor :position, :password

  def initialize(start)
    @position = start 
    @password = 0
  end

  def calculate_psswrd(attachment)
    lines = attachment.split("\n")

    for movement in lines do
      move(movement)
    end

    @password
  end

  def click(direction)
    if direction == 'R'
      @position += 1 
    elsif direction == 'L'
      @position -= 1
    end

    if @position == -1
      @position = 99
    elsif @position == 100
      @position = 0
    end

    if @position == 0
      @password += 1
    end
  end

  def move(movement)
    direction = movement[0]
    clicks = movement[1..].to_i
    x = 0

    while x < clicks
      click(direction)
      x += 1
    end
  end

end

if __FILE__ == $0

  dial = Dial.new(50)
  path = File.join(__dir__, "day1input")
  content = File.read(path)
  puts dial.calculate_psswrd(content)

end
