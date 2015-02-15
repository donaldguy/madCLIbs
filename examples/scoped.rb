require 'madCLIbs'
require 'term/ansicolor'

$cli = MadCLIbs.new
$color = Term::ANSIColor

s1, s2 = $cli.prompt($color.bold,
                    "Should also work without",
                    $color.cyan($cli.string("polluting too many")),
                    $color.red($cli.string("namespaces")),
                    $color.reset)

puts "Field values s1=#{s1}, s2=#{s2}"
