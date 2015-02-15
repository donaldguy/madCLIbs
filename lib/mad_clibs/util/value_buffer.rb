class ValueBuffer
  def initialize(s="")
    self.value = s
  end

  def left
    @position -= 1 if @position > 0
  end

  def right
    @position += 1
  end

  def backspace
    @position -= 1
    @buffer = @buffer[0..-2]
  end

  def << c
    @buffer << c
    @position += 1
  end

  def value=(s)
    @buffer = s.dup
    @position = s.length
  end

  def value
    @buffer
  end
end
