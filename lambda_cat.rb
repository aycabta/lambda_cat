puts 'begin'
puts '  [(\\'
ARGV.each do |filename|
  open(filename, 'r') do |f|
    f.each do |line, escaped = line.chomp.gsub(/('|\\)/, '\\\\\1')|
      puts "    lambda { |l| lambda { puts '#{escaped}'; l } }.call\\"
    end
  end
end
puts '  (lambda{lambda}))].cycle.inject { |l| l.() }'
puts 'rescue ArgumentError'
puts 'end'

