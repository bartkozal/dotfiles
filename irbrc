require 'rubygems' unless defined? Gem
require 'irb/completion'
require 'irb/ext/save-history'
require 'pp'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1024
IRB.conf[:AUTO_INDENT] = true

class Object
  def ls(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  def bm(times = 1)
    require 'benchmark'
    ret = nil
    Benchmark.bm { |x| x.report { times.times { ret = yield } } }
    ret
  end
end

alias q exit
