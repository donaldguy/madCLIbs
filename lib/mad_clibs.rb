class MadClibs
  autoload :Line, 'mad_clibs/line'
  autoload :Blanks, 'mad_clibs/blanks'
  autoload :Prompter, 'mad_clibs/prompter'

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
