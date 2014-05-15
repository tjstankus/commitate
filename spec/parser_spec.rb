module Commitate
  describe Parser do

    let(:markdown) { "<<[test.rb](123456789abcde){'lines':'1,5-8'}" }
    let(:parser) { Parser.new(markdown) }

    it 'parses the filename' do
      pending 'Improve, DRY regex'
      expect(parser.filename).to eq('test.rb')
    end

    it 'parses the commit sha'

    it 'parses line options'

  end
end
