require 'madCLIbs/import'


name, food = prompt("My name is", string(ENV['USER']), "and I like", string("chicken") )

puts "Your name is #{name} and you like #{food}"
