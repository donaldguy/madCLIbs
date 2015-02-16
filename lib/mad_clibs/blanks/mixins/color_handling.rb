require 'term/ansicolor'

module Term::ANSIColor
  alias old_color color
  def color(name, string = nil, &block)
    if string.respond_to? :save_and_remove_color
      string.send :save_and_remove_color, old_color(name, string.value)
      string
    else
      old_color(name, string, &block)
    end
  end
end

class MadClibs
  module Blanks::Mixins
    module ColorHandling
      include Term::ANSIColor

      def save_and_remove_start_color(s)
        @colored_placeholder = s
        stripped = uncolor(s)

        @placeholder_inherits_style = (@colored_placeholder == stripped)
        stripped
      end

      def save_and_remove_color(s)
        @color_seed ||= '%{value}'
        colored = s
        uncolored = uncolor(s)
        new_color_seed = colored.sub(uncolored, '%{value}')
        @color_seed = new_color_seed % {value: @color_seed}
        uncolored
      end

      def restore_color(v)
        if placeholder_showing? and !@placeholder_inherits_style
          @colored_placeholder
        elsif @color_seed
          @color_seed % {value: v}
        else
          value
        end
      end

      def to_str
        value
      end
    end
  end
end
