require "rails_helper"

module TelehealthPrimEngine
  RSpec.describe ConsentForm, type: :model do
    def valid_attributes
      [{ expires_on: Date.today, study_number: "123", version: "abc" }]
    end

    def invalid_attributes
      [
        { expires_on: nil, study_number: "123", version: "abc" },
        { expires_on: Date.today, study_number: nil, version: "abc" },
        { expires_on: Date.today, study_number: "0" * 100, version: "abc" },
        { expires_on: Date.today, study_number: "123", version: nil },
        { expires_on: Date.today, study_number: "123", version: "a" * 100 }
      ]
    end

    it "accepts valid attributes" do
      valid_attributes.each { |a| expect(ConsentForm.new(a)).to be_valid }
    end

    it "rejects invalid attributes" do
      invalid_attributes.each do |a|
        expect(ConsentForm.new(a)).not_to be_valid
      end
    end
  end
end
