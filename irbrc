require 'rubygems' unless defined? Gem
require 'irb/completion'
require 'irb/ext/save-history'
require 'pp'
require 'interactive_editor'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1024
IRB.conf[:AUTO_INDENT] = true

alias q exit

def pbcopy(string)
  `echo "#{string}" | pbcopy`
  string
end

def pbpaste
  `pbpaste`
end

