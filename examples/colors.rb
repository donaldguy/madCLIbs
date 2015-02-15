require 'madCLIbs/import'
require 'term/ansicolor'

include Term::ANSIColor

prompt(red("Tokens"), string("are"), red("styled"), string(green(bold("individually"))))

prompt("Placeholders can have", cyan(string("the same style as a typed value")))

prompt("Or a", red(string(cyan("different one"))))
prompt(green("Including"), red(string(reset("none"))))

prompt(bold, "You can also used unscoped colors", red,
       string(cyan("but")), "they leak til next reset", reset )

#you cannot/should not try to wrap multiple tokens in a scope tho
# none of this: prompt( bold("Question":, string("answer") ) )
