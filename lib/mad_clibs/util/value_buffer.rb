class ValueBuffer
  attr_reader :position

  def initialize(s="")
    self.value = s
  end

  def left
    @position -= 1 if @position >= 0
  end

  def right
    @position += 1 if @position < value.length
  end

  def backspace
    @buffer = @buffer[0..-2]
    left
  end

  def << c
    if @position < 0
      @position = 0
    end
    @buffer.insert(@position,c)
    @position += 1
  end

  def value=(s)
    @buffer = s.dup
    @position = -1
  end

  def value
    @buffer
  end
end
