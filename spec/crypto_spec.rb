require 'rspec'
require_relative '../lib/crypto'

describe 'Class Crypto' do
  before(:all) do
    current_path = File.dirname(__FILE__)
    @file_path = current_path + "/fixtures/crypto.txt"
    file = File.readlines(@file_path, "r:UTF-8")[0]
     @f1 = file.split("\n").last
     @f2 = file.split("\n").first
  end

  it 'коректно шифрует' do
    expect(Crypto.encode(@f1).split("\n").last).to eq 'U2VuZCByZWluZm9yY2VtZW50cw=='
  end

  it 'коректно дешифрует' do
    expect(Crypto.decode(@f2)).to eq 'Send reinforcements'
  end
end
