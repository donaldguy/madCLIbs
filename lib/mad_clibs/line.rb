class MadCLIbs
  class Line
    def initialize(*tokens)
      @tokens = []
      @blanks = []

      tokens.each { |t| self << t }
    end

    def <<(token)
      @tokens << token
      if token.respond_to?(:value) && token.respond_to?(:value=)
        @blanks << token
      end

      self
    end

    def values
      values = @blanks.map &:value
      values.length <= 1? values.first : values
    end
  end
end
