require 'rubygems'
require 'irb/completion'

if Gem.available?('wirble')
  require 'wirble'
  Wirble.init
  Wirble.colorize
end

IRB.conf[:PROMPT_MODE] = :SIMPLE

alias q exit
