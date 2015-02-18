require "rails_helper"

module TelehealthPrimEngine
  RSpec.describe PreScreening, type: :model do
    def valid_attributes
      [{ version: "abcd" }]
    end

    def invalid_attributes
      [
        { version: "abcd" * 15 },
        { version: nil }
      ]
    end

    it "accepts valid attributes" do
      valid_attributes.each { |a| expect(PreScreening.new(a)).to be_valid }
    end

    it "rejects invalid attributes" do
      invalid_attributes.each do |a|
        expect(PreScreening.new(a)).not_to be_valid
      end
    end
  end
end
