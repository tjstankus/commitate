require 'redcarpet'
require_relative 'processor'

module Commitate
  class Renderer < Redcarpet::Render::HTML

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
