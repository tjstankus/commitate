require 'support/markdown_snippets'

module Commitate
  describe Renderer do

    include MarkdownSnippets

    it 'sets default processor' do
      renderer = Renderer.new
      expect(renderer.processor).not_to be_nil
    end

    describe '#render annotation matching' do

      before do
        commitate_renderer = Renderer.new
        commitate_renderer.processor = double('processor',
                                              process: 'TestProcessor#process')
        @renderer = Redcarpet::Markdown.new(commitate_renderer)
      end

      context 'given markdown with commitate annotations' do

        let(:markdown) { markdown_with_commitate_annotations }

        it 'annotates the markdown' do
          html = @renderer.render(markdown)
          expect(html).to include('TestProcessor#process')
        end
      end

      context 'given markdown without commitate annotations' do

        let(:markdown) { basic_markdown }

        it 'does not alter the markdown' do
          html = @renderer.render(markdown)
          expect(html).not_to include('TestProcessor#process')
        end
      end

      context 'given commitate annotation with missing sha' do

        let(:markdown) { commitate_missing_sha }

        it 'does not alter the markdown' do
          html = @renderer.render(markdown)
          expect(html).not_to include('TestProcessor#process')
        end
      end

      context 'given commitate annotation with empty sha parens' do

        let(:markdown) { commitate_empty_sha_parens }

        it 'does not alter the markdown' do
          html = @renderer.render(markdown)
          expect(html).not_to include('TestProcessor#process')
        end
      end

      context 'given a commitate annotation with options' do

        let(:markdown) { markdown_with_commitate_annotations_options }

        it 'annotates the markdown' do
          html = @renderer.render(markdown)
          expect(html).to include('TestProcessor#process')
        end
      end
    end

  end
end
