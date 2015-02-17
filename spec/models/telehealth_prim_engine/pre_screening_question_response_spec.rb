require "rails_helper"

module TelehealthPrimEngine
  RSpec.describe PreScreeningQuestionResponse, type: :model do
    def valid_attributes
      [
        {
          response_set: PreScreeningResponseSet.new,
          question: PreScreeningQuestion.new,
          answer: PreScreeningAnswer.new
        }
      ]
    end

    def invalid_attributes
      [
        {
          response_set: nil,
          question: PreScreeningQuestion.new,
          answer: PreScreeningAnswer.new
        },
        {
          response_set: PreScreeningResponseSet.new,
          question: nil,
          answer: PreScreeningAnswer.new
        },
        {
          response_set: PreScreeningResponseSet.new,
          question: PreScreeningQuestion.new,
          answer: nil
        }
      ]
    end

    it "accepts valid attributes" do
      valid_attributes.each do |a|
        expect(PreScreeningQuestionResponse.new(a)).to be_valid
      end
    end

    it "rejects invalid attributes" do
      invalid_attributes.each do |a|
        expect(PreScreeningQuestionResponse.new(a)).not_to be_valid
      end
    end
  end
end
