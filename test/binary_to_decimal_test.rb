require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/binary_to_decimal'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "binary to decimal" do
  it "From 10011001 to 153" do
    binary_array = [1, 0, 0, 1, 1, 0, 0, 1]
    expected_decimal = 153

    binary_to_decimal(binary_array).must_equal expected_decimal
  end

  it "From 00001101 to 13" do
    binary_array = [0, 0, 0, 0, 1, 1, 0, 1]
    expected_decimal = 13

    binary_to_decimal(binary_array).must_equal expected_decimal
  end

  it "From 10000000 to 128" do
    binary_array = [1, 0, 0, 0, 0, 0, 0, 0]
    expected_decimal = 128

    binary_to_decimal(binary_array).must_equal expected_decimal
  end

  it "From random binary to decimal" do
    binary_array = Array.new(8) { rand(0..1) }
    expected_decimal = binary_array.join.to_s.to_i(2)

    binary_to_decimal(binary_array).must_equal expected_decimal
  end
end

describe "decimal ro binary" do
  it "From 153 to 10011001" do
    decimal_num = 153
    expected_binary = [1, 0, 0, 1, 1, 0, 0, 1]

    decimal_to_binary(decimal_num).must_equal expected_binary
  end

  it "From 13 to 00001101" do
    decimal_num = 13
    expected_binary = [1, 0, 1, 1]

    decimal_to_binary(decimal_num).must_equal expected_binary
  end

  it "From 128 to 10000000" do
    decimal_num = 128
    expected_binary = [0, 0, 0, 0, 0, 0, 0, 1]

    decimal_to_binary(decimal_num).must_equal expected_binary
  end

  it "From random binary to decimal" do
    decimal_num = rand(0...1000)
    binary_array = decimal_num.to_s(2).split(//).map do |i|
      i.to_i
    end
    expected_binary = binary_array.reverse

    decimal_to_binary(decimal_num).must_equal expected_binary
  end
end
