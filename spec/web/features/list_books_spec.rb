require 'features_helper'

describe 'List books' do
  before do
    BookRepository.clear

    BookRepository.create(Book.new(title: 'Magic Carpet', author: 'Aladdin'))
    BookRepository.create(Book.new(title: 'Genius', author: 'Aladdin'))
  end

  it 'displays each book on the page' do
    visit '/books'

    within '#books' do
      assert page.has_css?('.book', count: 2), 'Expected to find 2 books'
    end
  end
end
