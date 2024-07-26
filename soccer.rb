i = 1
data = {}
# read file line by line
File.readlines('soccer.dat', chomp: true).each do |line|
  if i > 3 # skip file header
    line_values = line.strip.split(" ") # clean and split file values
    if line_values.size == 10 # make sure data only receives valid data
      data[line_values[1]] = (line_values[6].to_i - line_values[8].to_i).abs
    end
  end
  i += 1
end

difference = 99999
team = ""
# look up for the max spreaded day
data.each do |tm, df|
  if difference > df
    difference = df
    team = tm
  end
end

p "Team: #{team} goals difference: #{difference}"
