require_relative 'util/iohelper'
require 'stringio'
require 'term/ansicolor'

class MadClibs
  class Prompter
    def initialize(controller)
      @controller = controller
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

      @tokens.length.times do |i|
        token = @tokens[i]
        if token.respond_to? :render
          buffer.print token.render
        elsif token.respond_to? :to_s
          buffer.print token
        end


        buffer.print seperator_between(token, @tokens.fetch(i+1, nil))
      end

      @io.rerender buffer.string
    end

    def seperator_between(a,b)
      if @controller.token_separator.respond_to? :call
        @controller.token_separator.call(a, b)
      else
        @controller.token_separator
      end
    end

    def getc
      @last_char = @io.read_key(false)
      case @last_char
      when "up", "shift-tab"
        previous_blank!
      when "tab", "down"
        #if @active_blank.has_completions?
        #end
        next_blank!
      when "return", "linefeed"
        @last_char = "return"
      when "ctrl-c", "ctrl-d"
        continue = @controller.interrupt_handler.()
        throw :escape unless continue
      else
        active_blank.key(@last_char)
      end
    end

    def place_cursor
      print @io.carriage_return

      @tokens.length.times do |i|
        t = @tokens[i]
        if t == active_blank
          print @io.char_right*t.position
          break
        end

        token_width = Term::ANSIColor.uncolored(t).length
        seperator_width = seperator_between(t, @tokens.fetch(i+1,nil)).size

        print @io.char_right*(token_width + seperator_width)
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
