require 'rails_helper'

describe "Index author page", type: :feature do

  before do
    @authors = []
    @authors << (FactoryBot.create :author)
    @authors << (FactoryBot.create :author_two)
  end

  it "should render withour error" do
    visit authors_path
  end

  it "should contain link to add new authors" do
    visit authors_path
    expect(page).to have_link 'New', href: new_author_path
  end

  it "should contain display author information and contain links" do
    visit authors_path
    @authors.each do |author|
      expect(page).to have_text author.first_name
      expect(page).to have_text author.last_name
      expect(page).to have_text author.homepage
      expect(page).to have_link href: author_path(author)
      expect(page).to have_link href: edit_author_path(author)
      expect(page).to have_css("a[data-method='delete'][href='/authors/#{author.id}']")
    end
  end

  it "should be possible to delete authors" do
    author = @authors[1]
    id = author.id
    visit authors_path
    find("a[data-method='delete'][href='/authors/#{author.id}']").click
    expect(Author.exists?(id: id)).to eq false
  end

end