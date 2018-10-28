require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should be associated with authors" do
    paper = Paper.new
    expect(paper.respond_to? :authors).to be true
  end
end
