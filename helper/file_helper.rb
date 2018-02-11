# file and folder manipulation.
module FileHelper
  def check_dir(directory)
    # puts get_dir()
    # puts("#{directory}directory")
    return File.directory?(directory);
  end
  def check_file(file)
    return File.exist?(file);
  end
  def get_dir()
    puts File.dirname(File.realpath(__FILE__))
  end
end
