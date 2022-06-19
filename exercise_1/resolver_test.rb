require_relative './resolver'

describe 'Input array is an empty array' do
  it 'expected .find_the_pairs will return an empty array' do
    expect(find_the_pairs(rand(1000), [])).to eq([])
  end
end

describe 'Input array' do
  let(:sum) { rand(100..1000).abs }
  let(:first_element) { rand(100...sum).abs }
  let(:second_element) { sum - first_element }
  let(:input_array) { 5.times.map{ rand(10).abs } }

  context 'does not have any valid pairs' do
    it 'expected .find_the_pairs will return an empty array' do
      expect(find_the_pairs(sum, input_array)).to eq([])
    end
  end

  context 'has a valid pair' do
    it 'expected .find_the_pairs will return an valid pair' do
      input_array << first_element << second_element

      expect(find_the_pairs(sum, input_array)).to eq([[first_element, second_element]])
    end
  end

  context 'has duplicated values' do
    it 'expected .find_the_pairs will return an valid pair' do
      input_array << first_element << second_element
      input_array << first_element << first_element

      expect(find_the_pairs(sum, input_array)).to eq([[first_element, second_element]])
    end
  end

  context 'has duplicated valid pairs' do
    it 'expected .find_the_pairs will return an valid pair' do
      input_array << first_element << second_element
      input_array << first_element << second_element

      expect(find_the_pairs(sum, input_array)).to eq([[first_element, second_element]])
    end
  end

  context 'has 2 valid pairs' do
    let(:third_element) { rand(100...sum).abs }
    let(:four_element) { sum - third_element }
  
    it 'expected .find_the_pairs will return an valid pair' do
      input_array << first_element << second_element
      input_array << third_element << four_element

      expect(find_the_pairs(sum, input_array)).to eq([[first_element, second_element], [third_element, four_element]])
    end
  end
end
