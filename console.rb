# console.rb
#!/usr/bin/env ruby

require "irb"
require "irb/completion" # easy tab completion
require_relative "test"

Dir.chdir '/app'
IRB.start
