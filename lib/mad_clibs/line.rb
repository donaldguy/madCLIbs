require 'term/ansicolor'

class MadCLIbs
  class Line
    def initialize(*tokens)
      @tokens = []
      @blanks = []

      tokens.each { |t| self << t }
      squash_colors
    end

    def <<(token)
      @tokens << token
      if token_is_blank? token
        @blanks << token
      end

      self
    end

    def values
      values = @blanks.map &:value
      values.length <= 1? values.first : values
    end

    def token_is_blank?(token)
      token.respond_to?(:value) && token.respond_to?(:value=)
    end

    # Add bare color tokens to the end (or failing that beginning)
    # of adjacent strings; fixes spacing when using bare colors
    def squash_colors
      types = @tokens.map do |t|
        if token_is_blank? t
          :blank
        elsif Term::ANSIColor.uncolored(t).empty?
          :color
        else
          :string
        end
      end

      @tokens.size.times do |i|
        case types[i]
        when :color
          if i != 0 and types[i-1] == :string
            @tokens[i-1] = @tokens[i-1] + @tokens[i]
            @tokens[i] = nil
            i += 1
          elsif i == @tokens.size - 1
            # its fine by itself.
          elsif types[i+1] == :string
            @tokens[i+1] = @tokens[i] + @tokens[i+1]
            @tokens[i] = nil
            i += 1
          end
        else
          #nothing
        end
      end

      @tokens = @tokens.reject { |t| t.nil? }
    end
  end
end
