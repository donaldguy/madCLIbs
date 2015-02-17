require_relative 'mixins/color_handling'
require_relative 'mixins/default_key_handling'

class MadClibs
  module Blanks
    class Base

      attr_reader :start_value, :completions
      attr_accessor :value, :position
      def length; self.value.length; end
      def empty?; self.value.length <= 0; end

      def render
        raise NotImplementedEror, "render called on abstract superclass D:"
      end

      def post_render
        true # no-op
      end

      def valid?
        raise NotImplementedEror, "valid? called on abstract superclass D:"
      end

      def placeholder_showing?
        @placeholder_showing = true unless defined? @placeholder_showing
        @placeholder_showing
      end

      def key(key)
        if placeholder_showing?
          default_key_placeholder_showing(key)
        else #no placeholder showing
          default_key_no_placeholder(key)
        end
      end

      def to_s
        value
      end

      protected
        include Mixins::ColorHandling
        include Mixins::DefaultKeyHandling
    end
  end
end
