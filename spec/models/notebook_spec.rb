require "rails_helper"

RSpec.describe Notebook, type: :model do
  it "has a valid factory" do
    expect(build(:notebook)).to be_valid
  end
end
