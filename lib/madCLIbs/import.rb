require_relative '../madCLIbs'

$MADCLIBS = MadCLIbs.new()

module Kernel
  extend Forwardable

  def_delegators :$MADCLIBS, :prompt, :string
end
