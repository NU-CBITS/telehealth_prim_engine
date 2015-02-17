require "rails_helper"

module TelehealthPrimEngine
  RSpec.describe PreScreeningAnswer, type: :model do
    def valid_attributes
      [
        {
          question: PreScreeningQuestion.new,
          position: 1,
          label: "label",
          value: true,
          kind: "boolean",
          eligible: true
        }
      ]
    end

    def invalid_attributes
      [
        {
          question: nil,
          position: 1,
          label: "label",
          value: true,
          kind: "boolean",
          eligible: true
        },
        {
          question: PreScreeningQuestion.new,
          position: -1,
          label: "label",
          value: true,
          kind: "boolean",
          eligible: true
        },
        {
          question: PreScreeningQuestion.new,
          position: 1,
          label: "label" * 60,
          value: true,
          kind: "boolean",
          eligible: true
        },
        {
          question: PreScreeningQuestion.new,
          position: 1,
          label: "label",
          value: nil,
          kind: "boolean",
          eligible: true
        },
        {
          question: PreScreeningQuestion.new,
          position: 1,
          label: "label",
          value: true,
          kind: "baz",
          eligible: true
        },
        {
          question: PreScreeningQuestion.new,
          position: 1,
          label: "label",
          value: true,
          kind: "boolean",
          eligible: nil
        }
      ]
    end

    it "accepts valid attributes" do
      valid_attributes.each do |a|
        expect(PreScreeningAnswer.new(a)).to be_valid
      end
    end

    it "rejects invalid attributes" do
      invalid_attributes.each do |a|
        expect(PreScreeningAnswer.new(a)).not_to be_valid
      end
    end
  end
end
