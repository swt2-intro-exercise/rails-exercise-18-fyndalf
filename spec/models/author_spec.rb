require 'rails_helper'

RSpec.describe Author, type: :model do

  it "should be constructed and have all instance variables" do
    author = build(:author)
    expect(author.first_name).to eq('Alan')
    expect(author.last_name).to eq('Turing')
    expect(author.homepage).to eq('http://wikipedia.de/Alan_Turing')
  end

  it "should construct the name as expected" do
    author = build(:author)
    expect(author.name).to eq('Alan Turing')
  end
end