i = 1
data = {}
# read file line by line
File.readlines('w_data.dat', chomp: true).each do |line|
  if i > 6 && i <= 36 # skip file header and footer
    line_values = line.strip.split(" ") # clean and split file values
    data[line_values[0]] = (line_values[1].to_f - line_values[2].to_f).abs
  end
  i += 1
end
spread = 0
max_day = 1
# look up for the max spreaded day
data.each do |day, sp|
  if sp > spread
    spread = sp
    max_day = day
  end
end

p "Day: #{max_day} spread: #{spread}"
