require 'fileutils'

# => [String, String, ..]
# files = Dir.entries("home/wesson")
files = Dir.entries(`echo $HOME`.chomp!)

files = files.map do |filename|
  File.expand_path(filename, "~")
end

files.each do |file|
  if File.ftype(file) == "link"
    FileUtils.remove file
    puts "Removed: #{file}"
  end
end

FileUtils.rm_rf(File.expand_path(".yadr", "~"))
puts "Removing the dotfile .yadr..."
puts "Removed: .yadr."
