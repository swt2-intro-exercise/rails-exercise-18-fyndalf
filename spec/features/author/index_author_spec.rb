require 'rails_helper'

describe "Index author page", type: :feature do

  it "should render withour error" do
    visit authors_path
  end

  it "should contain link to add new authors" do
    visit authors_path
    expect(page).to have_link 'New', href: new_author_path
  end

  it "should contain display author information" do
    @alan = FactoryBot.create :author
    visit authors_path
    expect(page).to have_text("Alan")
    expect(page).to have_text("Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
  end

end