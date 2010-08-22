# History and colors
require 'rubygems'
require 'wirble'

Wirble.init
Wirble.colorize

# Fast quit
alias q exit

# Display local methods
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end