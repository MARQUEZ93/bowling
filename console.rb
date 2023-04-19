require "irb"
require "irb/completion" # easy tab completion
require_relative "test"

Dir.chdir '/app'
IRB.start
