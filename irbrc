require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

if Gem.available?('wirble')
  require 'wirble'
  Wirble.init
  Wirble.colorize
end

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1024
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

alias q exit
