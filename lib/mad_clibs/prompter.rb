require_relative 'util/iohelper'
require 'stringio'
require 'term/ansicolor'

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
      @current_blank_index = 0

      until done?
        render
        place_cursor
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
      when "up"
        previous_blank!
      when "tab", "down"
        #if @active_blank.has_completions?
        #end
        next_blank!
      when "return", "linefeed"
        @last_char = "return"
      else
        active_blank.key(@last_char)
      end
    end

    def place_cursor
      print @io.carriage_return

      @tokens.each do |t|
        if t == active_blank
          print @io.char_right*t.position
          break
        end
        print @io.char_right*(Term::ANSIColor.uncolored(t).length+1) # + 1 for space
      end
    end

    def post_render
      @tokens.each do |token|
        token.post_render if token.respond_to? :post_render
      end
      render
      puts ""
    end

    def next_blank!
      @current_blank_index += 1
      @current_blank_index = 0 if @current_blank_index >= @blanks.length
    end

    def previous_blank!
      @current_blank_index -= 1
      @current_blank_index = @blanks.length - 1 if @current_blank_index < 0
    end

    def active_blank
      @blanks[@current_blank_index]
    end
  end
end
