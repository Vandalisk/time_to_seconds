require './convert_to_seconds.rb'
require 'spec_helper'

RSpec.describe StringToSecondsConverter do
  it '1 year' do
    string = '1 year'
    expect(StringToSecondsConverter.new(string).convert!).to eq(31536000)
  end

  it '1 year 2 months' do
    string = '1 years 2 months'
    expect(StringToSecondsConverter.new(string).convert!).to eq(36720000)
  end

  it '1 year 2 months 3 days' do
    string = '1 year 2 months 3 days'
    expect(StringToSecondsConverter.new(string).convert!).to eq(36979200)
  end

  it '1 year 2 months 3 days 4 hours' do
    string = '1 year 2 months 3 days 4 hours'
    expect(StringToSecondsConverter.new(string).convert!).to eq(36993600)
  end

  it '1 year 2 months 3 days 4 hours 5 minutes' do
    string = '1 year 2 months 3 days 4 hours 5 minutes'
    expect(StringToSecondsConverter.new(string).convert!).to eq(36993900)
  end

  it '1 year 2 months 3 days 4 hours 5 minutes 6 seconds' do
    string = '1 year 2 months 3 days 4 hours 5 minutes 6 seconds'
    expect(StringToSecondsConverter.new(string).convert!).to eq(36993906)
  end

  it '5 years' do
    string = '5 years'
    expect(StringToSecondsConverter.new(string).convert!).to eq(157680000)
  end

  it '5 seconds' do
    string = '5 seconds'
    expect(StringToSecondsConverter.new(string).convert!).to eq(5)
  end

  it '5 years 5 seconds' do
    string = '5 years 5 seconds'
    expect(StringToSecondsConverter.new(string).convert!).to eq(157680005)
  end
end