require 'rspec'
require_relative 'support/support_moduleofmethod'

describe ModuleOfMethods do
  before(:all) do
    current_path = File.dirname(__FILE__)
    @file_path = current_path + "/fixtures/text.txt"
    @file = File.readlines(@file_path, "r:UTF-8")[0]
  end

  it '#key_from_file' do
    expect(key_from_file(@file)).to eq "123"
  end

  it 'password empty?' do
    input = ""
    expect(set_password(input.to_s)).to eq "\npasswordwhenspace"
  end

  it 'check pass input' do
    input = "123"
    expect(set_password(input.to_s)).to eq "\npasswordwhenspace123"
  end
end
