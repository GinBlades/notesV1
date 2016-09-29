require "rails_helper"

RSpec.describe Relationship, type: :model do
  it "has a valid factory" do
    expect(build(:relationship)).to be_valid
  end
end
