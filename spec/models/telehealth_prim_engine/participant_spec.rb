require "rails_helper"

module TelehealthPrimEngine
  RSpec.describe Participant, type: :model do
    def valid_attributes
      [{ external_id: "abcd" }]
    end

    def invalid_attributes
      [
        { external_id: "abcd" * 15 },
        { external_id: nil }
      ]
    end

    it "accepts valid attributes" do
      valid_attributes.each { |a| expect(Participant.new(a)).to be_valid }
    end

    it "rejects invalid attributes" do
      invalid_attributes.each do |a|
        expect(Participant.new(a)).not_to be_valid
      end
    end
  end
end
