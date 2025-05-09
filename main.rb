require "pry-byebug"
require_relative "lib/square"
require_relative "lib/knights"

knights = Knights.new([3, 3])
knights.path([4, 3])
