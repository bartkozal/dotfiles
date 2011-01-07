require 'rubygems'
require 'wirble'
require 'hirb'

Wirble.init
Wirble.colorize

Hirb.enable

IRB.conf[:PROMPT_MODE] = :SIMPLE

alias q exit

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end
