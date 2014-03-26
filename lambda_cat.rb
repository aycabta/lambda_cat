puts 'begin'
puts '  [(\\'
ARGV.each do |filename|
  open(filename, 'r') do |f|
    f.readlines.each do |line|
      puts "    lambda { |l| lambda { puts '#{line.chomp.gsub(/'|\\/, "'" => "\\'", '\\' => '\\\\')}'; l } }.call\\"
    end
  end
end
puts '  (lambda{}))].cycle.inject { |l| l.() }'
puts 'rescue NoMethodError'
puts 'end'

