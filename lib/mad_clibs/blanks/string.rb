require_relative 'base'
require_relative '../util/value_buffer'

class MadClibs
  class Blanks::String < Blanks::Base
    def initialize(s)
      @start_value = s.to_s
      @completions = nil
    end

    def render
      value
    end

    def valid?
      !empty?
    end
  end
end
