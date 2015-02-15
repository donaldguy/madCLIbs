require_relative 'util/iohelper'
require 'stringio'

class MadClibs
  class Prompter
    def initialize
      @io = IOHelper
      reinit
    end

    def prompt(line)
      reinit
      @tokens = line.instance_variable_get(:@tokens)
      @blanks = line.instance_variable_get(:@blanks)
      @it_blank = @blanks.each

      until done?
        render
        getc
      end

      post_render
    end

private
    def reinit
      @last_char = nil
      @tokens = nil
      @blanks = nil
      @active_blank = nil
    end

    def done?
      @last_char == 'return'
    end

    def render
      buffer = StringIO.new

      @tokens.each do |token|
        if token.respond_to? :render
          buffer.print token.render
        elsif token.respond_to? :to_s
          buffer.print token
        end

        buffer.print " "
      end

      @io.rerender buffer.string
    end

    def getc
      @last_char = @io.read_key
      case @last_char
      when "tab"
        #if @active_blank.has_completions?
        #end
        begin
          @it_blank.next
          @it_blank.peek
        rescue StopIteration
          @it_blank.rewind
        end
      when "return", "linefeed"
        @last_char = "return"
      else
        @it_blank.peek.key(@last_char)
      end
    end

    def post_render
      @tokens.each do |token|
        token.post_render if token.respond_to? :post_render
      end
      render
      puts ""
    end
  end
end
