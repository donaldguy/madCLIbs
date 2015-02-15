class MadClibs
  module Blanks::Mixins::DefaultKeyHandling
    def default_key_placeholder_showing(key)
      case key
      when"backspace"
        #toggle visible display of value; leave behavior the same
        #whether placeholder visible or not
        if self.value == start_value
          self.value = ""
        else
          self.value = start_value
        end
      when "left", "right"
        #ignore it
      else # normal character -> start writing in
        self.value = ""
        value_key(key)
        @placeholder_showing = false
      end
    end

    def default_key_no_placeholder(key)
      case key
      when"backspace"
        value_key(key)
        if self.value.empty?
          self.value = start_value
          @placeholder_showing = true
        end
      else
        value_key(key)
      end
    end
  end
end
