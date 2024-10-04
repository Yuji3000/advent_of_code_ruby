def calculate_sum_of_calibrated_values
  file_content = File.read(File.join(__dir__, "../input.txt"))
  input_array = file_content.split

  nums_only = input_array.map do |line|
    split_line = line.split("")
    split_line.select do |char|
      char.match?(/[[:digit:]]/)
    end
  end

  sum = 0
  calibrate_values = nums_only.map do |num_arry|
    sum += (num_arry[0] + num_arry[-1]).to_i  if num_arry.length >= 2
    sum += (num_arry[0] + num_arry[0]).to_i  if num_arry.length == 1
  end
  sum
end


puts calculate_sum_of_calibrated_values