require_relative 'lib/moduleofmethods'
include ModuleOfMethods

check_file_in_dir

current_path = File.dirname(__FILE__)
dir_path = current_path + "/data/"
file_in_dir = Dir.entries(dir_path)
file = file_in_dir.select {|v| v.match(/^*.txt/)}

FILE_PATH = "#{File.dirname(__FILE__)}/data/#{file.first}"

if choice_variant == 1
  rewrite_to(encode(get_file))
  puts "Ведите пароль для шифрования"
  write_to(encode(set_password(user_input)))
  puts "Шифровка произведена"
else
  puts "Ведите пароль для дешифровки"
  check_password(user_input)
  rewrite_to(decode(get_file).chomp(key_from_file(get_file)))
  puts "Дешифровка произведена"
end
