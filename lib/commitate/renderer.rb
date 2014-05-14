require 'redcarpet'
require_relative 'processor'

module Commitate
  class Renderer < Redcarpet::Render::HTML
    MIN_SHA_LEN = 4

    COMMITATE_REGEX = /^>>                      # start with 2 right angles chars
                       \[(.+)\]                 # filename in brackets
                       \((.{#{MIN_SHA_LEN},})\) # commit sha in parens
                      /x

    attr_accessor :processor

    def initialize
      @processor = Processor
      super
    end

    def preprocess(doc)
      doc.gsub(COMMITATE_REGEX) { |mdown| processor.process(mdown) }
    end
  end
end
