puts 'begin'
puts '  [(\\'
ARGV.each do |filename|
  if filename == '-'
    lambda { |&block| $stdin.each_line(&block) }
  else
    lambda { |&block| open(filename, 'r') { |f| f.each(&block) } }
  end.call do |line, escaped = line.chomp.gsub(/('|\\)/, '\\\\\1')|
    puts "    lambda { |l| lambda { l.tap { puts '#{escaped}'} } }.call\\"
  end
end
puts '  (lambda{lambda}))].cycle.inject { |l| l.call }'
puts 'rescue ArgumentError'
puts 'end'
