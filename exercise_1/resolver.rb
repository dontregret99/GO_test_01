def my_method(target, arr)
  result = []
  valid_first = []
  second_elements = []

  arr.each do |i|
    if (i < target) && (i != target/2) && !valid_first.include?(i)
      if second_elements.include?(i)
        pos = second_elements.find_index(i)
        result[pos] = [result[pos][0], i]
        valid_first << i
      else
        result << [i, nil]
        second_elements << (target - i)
      end
    end
  end

  result
end

p my_method(10, [3, 4, 5, 6, 7])
p my_method(8, [3, 4, 5, 4, 4])
