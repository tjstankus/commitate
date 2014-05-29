require 'commitate/version'
require 'commitate/parser'
require 'commitate/processor'
require 'commitate/renderer'

module Commitate
  MIN_SHA_LEN = 4

  COMMITATE_REGEX = /^>>                      # start with 2 right angles chars
                     \[(.+)\]                 # filename in brackets
                     \((.{#{MIN_SHA_LEN},})\) # commit sha in parens
                    /x
end
