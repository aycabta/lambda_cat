lines_sum = 0
ARGV.each do |filename|
  open(filename, 'r') do |f|
    f.readlines.each do |line|
      puts "lambda{ |l| puts '#{line.chomp.gsub("'", "\\'")}'; l.() }.call\\"
      lines_sum += 1
    end
  end
end
puts "(1..#{lines_sum - 1}).inject(lambda{}){ |r| lambda{r} }"
