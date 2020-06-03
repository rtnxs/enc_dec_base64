class FileReader
  def self.read_from_file(file_path)
    File.readlines(file_path, "r:UTF-8")[0]
  end
end
