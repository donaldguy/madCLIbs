require 'active_support/dependencies/autoload'

module MadClibs::Autoload
  include ActiveSupport::Autoload

  def autoload(*args)
    args.each { |mod| super mod }
  end
end
