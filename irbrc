require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1024
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

if Gem.available?('wirble')
  require 'wirble'
  Wirble.init
  Wirble.colorize
end

alias q exit
