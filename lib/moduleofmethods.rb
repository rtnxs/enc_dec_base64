require_relative "crypto"
require_relative "file_reader"
require_relative "file_writer"

module ModuleOfMethods
  def check_file_in_dir
    abort "Слишком много текстовых файлов" if Dir["./data/*.txt"].size > 1
    abort "Нет файла для кодирования/декодирования " \
          "в папке /data" if Dir["./data/*.txt"].empty?
  end

  def user_input
    STDIN.gets.chomp
  end

  def get_file
    FileReader.read_from_file(FILE_PATH)
  end

  def key_from_file(file)
    decode(file.split("\n").last)
  end

  def set_password(user_input)
    "\npasswordwhenspace" + user_input
  end

  def check_password(user_input)
    abort "Не правильный пароль для дешифровки" \
          "" if set_password(user_input) != key_from_file(get_file)
  end

  def encode(file)
    Crypto.encode(file)
  end

  def decode(file)
    Crypto.decode(file)
  end

  def rewrite_to(file)
    FileWriter.rewrite_to_file(FILE_PATH, file)
  end

  def write_to(file)
    FileWriter.write_to_file(FILE_PATH, file)
  end

  def choice_variant
    choice = nil
    until choice == 1 || choice == 2
      puts "что делаем?\n1 - шифруем\n2 - дешифруем"
      choice = user_input.to_i
      puts "\nвы ввели #{choice} - неправильнo, повнимательнее\n\n\n" unless [1, 2].include?(choice)
    end
    choice
  end
end
