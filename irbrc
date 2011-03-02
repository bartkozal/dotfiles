unless IRB.version.include?("DietRB")
  require 'rubygems'
  require 'wirble'

  Wirble.init
  Wirble.colorize
end

IRB.conf[:PROMPT_MODE] = :SIMPLE

alias q exit
