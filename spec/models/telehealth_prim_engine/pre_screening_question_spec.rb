require "rails_helper"

module TelehealthPrimEngine
  RSpec.describe PreScreeningQuestion, type: :model do
    def valid_attributes
      [{ pre_screening: PreScreening.new, label: "label", position: 1 }]
    end

    def invalid_attributes
      [
        { pre_screening: nil, label: "label", position: 1 },
        { pre_screening: PreScreening.new, label: nil, position: 1 },
        { pre_screening: PreScreening.new, label: "abcd" * 60, position: 1 },
        { pre_screening: PreScreening.new, label: "label", position: -1 }
      ]
    end

    it "accepts valid attributes" do
      valid_attributes.each do |a|
        expect(PreScreeningQuestion.new(a)).to be_valid
      end
    end

    it "rejects invalid attributes" do
      invalid_attributes.each do |a|
        expect(PreScreeningQuestion.new(a)).not_to be_valid
      end
    end
  end
end
