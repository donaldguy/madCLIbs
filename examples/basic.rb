require 'madCLIbs/import'
require 'term/ansicolor'

include Term::ANSIColor

name, food = prompt("My name is", cyan(bold(string(ENV['USER']))), "and I like", bold(string("chicken")) )

puts "Your name is #{name} and you like #{food}"
