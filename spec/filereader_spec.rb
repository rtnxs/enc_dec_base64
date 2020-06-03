require 'rspec'
require_relative '../lib/file_reader'

describe FileReader do
  before(:all) do
    current_path = File.dirname(__FILE__)
    @dir_path = current_path + "/fixtures/"
    @file_path = current_path + "/fixtures/text.txt"
    @file_in_dir = Dir.entries(@dir_path)
    @file_in_dir.shift(2)
  end

  it '.read_from_file' do
    expect(FileReader.read_from_file(@file_path)).to eq "The Base64\nMTIz"
  end

  it 'dir not empty?' do
    expect(@file_in_dir.nil?).to eq false
  end
end