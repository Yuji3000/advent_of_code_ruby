def read_and_split
  file_content = File.read(File.join(__dir__, "../input.txt")).split("\n")
  file_content
end

puts read_and_split