class InvalidIdChecker
  def verify_range(first,last)
    result = 0

    for number in first..last do
      if silly?(number)
        result += number
      end
    end
    result
  end

  def verify_input(input)
    result = 0
    pairs = input.split(',')
    for pair in pairs do
     result += verify_range(pair.split('-')[0].to_i,pair.split('-')[1].to_i)
    end
    result
  end

  def silly?(number)
    s = number.to_s
    middle = (s.length)/2

    (1..middle).any? do |len|
      next false unless (s.length % len).zero?
      part = s[0,len]
      (part * (s.length / len)) == s
    end
  end
end

if __FILE__ == $0
  id_checker = InvalidIdChecker.new
  path = File.join(__dir__,"day2input") 
  content = File.read(path)
  puts id_checker.verify_input(content)
end
