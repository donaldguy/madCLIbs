class MadClibs
  autoload :Line, 'mad_clibs/line'
  autoload :Blanks, 'mad_clibs/blanks'
  autoload :Prompter, 'mad_clibs/prompter'

  attr_accessor :interrupt_handler
  attr_accessor :token_separator

  def initialize(config = {})
    @prompter = Prompter.new(self)
    @interrupt_handler = config[:interrupt_handler]
    @interrupt_handler ||= ->() { raise Interrupt }
    @token_separator = config[:separator] || " "
  end

  def prompt(*args)
    l = Line.new(*args)
    catch :escape do
      @prompter.prompt(l)
      l.values()
    end
  end

  def string(val)
    Blanks::String.new(val)
  end
end
