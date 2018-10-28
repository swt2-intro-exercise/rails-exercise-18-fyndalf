require 'rails_helper'

describe "papers/index", type: :feature do
  it "should render without error" do
    visit papers_path
  end

  it "should filter papers by year" do
    @papers = FactoryBot.create(:paper)
    visit papers_path.concat("?year=#{@papers.year}")
    expect(page).to have_text(@papers.title)
    visit papers_path.concat("?year=#{@papers.year + 123}")
    expect(page).not_to have_text(@papers.title)
  end
end
