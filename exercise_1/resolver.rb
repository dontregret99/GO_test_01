def find_the_pairs(sum, arr)
  pairs = []
  first_elements = []
  second_elements = []

  arr.each do |element|
    if (element < sum) && (element != sum/2) && !first_elements.include?(element)
      if second_elements.include?(element)
        pos = second_elements.find_index(element)
        pairs[pos] = [pairs[pos][0], element]

        first_elements << element
      else
        pairs << [element, nil]
        second_elements << (sum - element)
      end
    end
  end

  result = []
  pairs.each do |pair|
    result << pair if pair[1] != nil
  end

  result
end
