class MadClibs::Blanks::Base
  attr_reader :start_value, :completions

  def render
    raise NotImplementedEror, "render called on abstract superclass D:"
  end

  def post_render
    true # no-op
  end

  def valid?
    raise NotImplementedEror, "valid? called on abstract superclass D:"
  end

  def value
    @valuebuff ||= ValueBuffer.new(start_value)
    @valuebuff.value
  end

  def value=(v)
    @valuebuff ||= ValueBuffer.new(v)
    @valuebuff.value = v
  end

  def length
    self.value.length
  end

  def empty?
    value.empty?
  end

  def key(key)
    @placeholder_showing = true unless defined? @placeholder_showing

    if @placeholder_showing
      default_key_placeholder_showing(key)
    else #no placeholder showing
      default_key_no_placeholder(key)
    end
  end

  protected
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
        self.value = key
        @placeholder_showing = false
      end
    end

    def default_key_no_placeholder(key)
      case key
      when"backspace"
        @valuebuff.backspace
        if self.value.empty?
          self.value = start_value
          @placeholder_showing = true
        end
      when "left", "right"
        @valuebuff.send key.to_sym
      else # normal character
        @valuebuff << key
      end
    end
end
