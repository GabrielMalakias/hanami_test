require 'spec_helper'
require_relative '../../../../apps/web/views/books/index'

describe Web::Views::Books::Index do
  let(:exposures) { Hash[books: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/index.html.erb') }
  let(:view)      { Web::Views::Books::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #books' do
    view.books.must_equal exposures.fetch(:books)
  end

  describe 'when there are no books' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no books yet.</p>')
    end
  end

  describe 'when there are no books' do
    let(:book1)     { Book.new(title: 'Magic Carpet', author: 'Aladdin') }
    let(:book2)     { Book.new(title: 'Genius', author: 'Aladdin') }
    let(:exposures) { Hash[books: [book1, book2]] }

    it 'lists then all' do
      puts rendered
      rendered.scan(/class="book"/).count.must_equal 2
      rendered.must_include('Magic Carpet')
      rendered.must_include('Genius')
    end

    it 'shows a placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no books yet.</p>')
    end
  end
end
