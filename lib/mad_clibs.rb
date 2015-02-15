require 'mad_clibs/autoload'

class MadClibs
  extend MadClibs::Autoload

  autoload :Blanks, :Line, :Prompter

  def initialize()
    @prompter = Prompter.new
  end

  def prompt(*args)
    l = Line.new(*args)
    @prompter.prompt(l)
    l.values()
  end

  def string(val)
    Blanks::String.new(val)
  end
end
