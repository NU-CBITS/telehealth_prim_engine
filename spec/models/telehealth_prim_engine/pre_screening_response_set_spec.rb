require "rails_helper"

module TelehealthPrimEngine
  RSpec.describe PreScreeningResponseSet, type: :model do
    def valid_attributes
      [
        {
          pre_screening: PreScreening.new,
          participant: Participant.new,
          completed_at: DateTime.new
        }
      ]
    end

    def invalid_attributes
      [
        {
          pre_screening: nil,
          participant: Participant.new,
          completed_at: DateTime.new
        },
        {
          pre_screening: PreScreening.new,
          participant: nil,
          completed_at: DateTime.new
        },
        {
          pre_screening: PreScreening.new,
          participant: Participant.new,
          completed_at: nil
        }
      ]
    end

    it "accepts valid attributes" do
      valid_attributes.each do |a|
        expect(PreScreeningResponseSet.new(a)).to be_valid
      end
    end

    it "rejects invalid attributes" do
      invalid_attributes.each do |a|
        expect(PreScreeningResponseSet.new(a)).not_to be_valid
      end
    end
  end
end
