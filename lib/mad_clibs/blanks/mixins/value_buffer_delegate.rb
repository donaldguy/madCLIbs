require_relative '../../util/value_buffer'

class MadClibs
  module Blanks::Mixins::ValueBufferDelegate
    def value
      @valuebuff ||= ValueBuffer.new(save_and_remove_start_color(start_value))
      @valuebuff.value
    end

    def value=(v)
      @valuebuff ||= ValueBuffer.new(save_and_remove_color(v))
      @valuebuff.value = v
    end

    def value_key(key)
      case key
      when "backspace"
        @valuebuff.backspace
      when "left"
        @valuebuff.left
      when "right"
        @valuebuff.right
      when /./
        @valuebuff << key
      else
        raise ArgumentError, "No handler for key '#{key}' (while focused on this blank)"
      end
    end

    def position
      @valuebuff.position > 0 ? @valuebuff.position : 0
    end
  end
end
