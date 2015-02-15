require 'madCLIbs/import'
require 'term/ansicolor'

include Term::ANSIColor

name, food, side = prompt("My name is",
                    cyan(bold(string(ENV['USER']))),
                    "and I like",
                    bold(string("chicken")),
                    "with",
                    string(green("rice"))
                   )

puts "Your name is #{name} and you like #{food} with #{side}"
