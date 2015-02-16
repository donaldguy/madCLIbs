#you can specify custom Ctrl-C behavior

require 'madCLIbs'
require 'term/ansicolor'

$cli = MadCLIbs.new
$color = Term::ANSIColor

$cli.interrupt_handler = ->(){ puts "\nRetrying"; return true }

now = $cli.prompt("Push ^C",
                    $color.green($cli.string("now")),
                  )

puts "Field value s1=#{now}"

$cli.interrupt_handler = ->(){ puts "\nAborting"; return false }

now = $cli.prompt("Push ^C",
                    $color.red($cli.string("now")),
                  )

puts "Field value s1=#{now.inspect}"
