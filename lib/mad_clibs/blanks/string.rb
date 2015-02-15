require_relative 'base'
require_relative 'mixins/value_buffer_delegate'

class MadClibs
  module Blanks
    class String < Base
      include Mixins::ValueBufferDelegate

      def initialize(s)
        @start_value = s.to_s
        @completions = nil
      end

      def render
        restore_color(value)
      end

      def valid?
        !empty?
      end
    end
  end
end
