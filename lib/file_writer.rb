class FileWriter
  def self.rewrite_to_file(file_path, data)
    File.write(file_path, data)
  end

  def self.write_to_file(file_path, data)
    file = File.open(file_path, "a:UTF-8")
    file.write(data)
    file.close
  end
end
