require 'irb/completion'
require 'irb/ext/save-history'
require 'pp'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:EVAL_HISTORY] = 1024
IRB.conf[:SAVE_HISTORY] = 1024
IRB.conf[:HISTORY_FILE] = File.expand_path("~/.irb_history")
IRB.conf[:AUTO_INDENT] = true

alias q exit

def pbcopy(string)
  `echo "#{string}" | pbcopy`
  string
end

def pbpaste
  `pbpaste`
end
