require 'rails_helper'

describe "papers/edit", type: :feature do
  before do
    @paper = FactoryBot.create(:paper)
    @author_two = FactoryBot.create(:author_two)
  end

  it "should display authors" do
    visit edit_paper_path(@paper)
    expect(page).to have_css("select[multiple]")
  end

  it "should update authors belonging to paper" do
    authors = @paper.authors.count
    visit edit_paper_path(@paper)
    page.select @author_two.name, from: "paper[author_ids][]"
    find('input[type="submit"]').click
    @paper.reload
    expect(@paper.authors.count).to eq (authors + 1)
    expect(@paper.authors).to include(@author_two)
  end
end
