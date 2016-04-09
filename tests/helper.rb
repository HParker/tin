$VERBOSE = !!ENV["VERBOSE"]

ENV["RACK_ENV"] = "test"

require_relative "../app"
require "cuba/test"
require "posten/test"
require 'riot'
# prepare do
#   Ohm.flush
#   Posten.reset
# end
