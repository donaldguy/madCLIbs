# MadCLI</tt>bs:<br> User-Friendly Fill-in-the-Blank(s) UX for your Terminal Application
[![Gem Version](https://badge.fury.io/rb/madCLIbs.svg)](http://badge.fury.io/rb/madCLIbs) [![Code Climate](https://codeclimate.com/github/donaldguy/madCLIbs/badges/gpa.svg)](https://codeclimate.com/github/donaldguy/madCLIbs) [![Dependency Status](https://gemnasium.com/donaldguy/madCLIbs.svg)](https://gemnasium.com/donaldguy/madCLIbs)


Seeks to mimic the familiar UX of HTML5 form elements, with
[placeholders](http://diveintohtml5.info/forms.html#placeholder),
in the terminal.

Allows a program to present a line with one or more "blanks" which can be edited and moved between
at will (with `Tab` or :arrow_up: & :arrow_down: keys). On `Return`/new line, returns the values of the blanks (treating
placeholders as a default values if no editing occured)

The name is supposed to be Mad Libs with a CLI in it, but you might also
reasonably call it "Mad CLI BS" :smile:

You could, in fact, use it to make a sweet Mad Libs app, but its also
pretty useful for things like [Dramaturg](https://github.com/donaldguy/dramaturg)
(for which it was created)

## Usage

See [examples](https://github.com/donaldguy/madCLIbs/tree/master/examples)

## Contributing

1. Fork it ( https://github.com/donaldguy/madCLIbs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
