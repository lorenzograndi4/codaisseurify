require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:bio).is_at_most(500) }
  end

  describe "association with song" do
    let(:artist) { create :artist }
    let(:song) { create :song, artist: artist }
    it { is_expected.to have_many :songs }
  end
end
