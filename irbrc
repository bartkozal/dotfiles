# History and colors
require 'rubygems'
require 'wirble'

Wirble.init
Wirble.colorize

# Alias to exit
alias q exit

# Display local methods of object
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end