require 'rubygems'
require 'wirble'

Wirble.init
Wirble.colorize

alias q exit

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end
