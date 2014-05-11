class TestProcessor
  def self.process(markdown)
    processor = new(markdown)
    processor.process
  end

  def initialize(markdown)
  end

  def process
    'TestProcessor#process'
  end
end
