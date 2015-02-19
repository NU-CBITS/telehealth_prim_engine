require "rails_helper"

module TelehealthPrimEngine
  RSpec.describe ConsentNotification, type: :model do
    def valid_attributes
      [
        {
          participant: Participant.new,
          consent_form: ConsentForm.new,
          sent_at: DateTime.now
        }
      ]
    end

    def invalid_attributes
      [
        {
          participant: nil,
          consent_form: ConsentForm.new,
          sent_at: DateTime.now
        },
        {
          participant: Participant.new,
          consent_form: nil,
          sent_at: DateTime.now
        },
        {
          participant: Participant.new,
          consent_form: ConsentForm.new,
          sent_at: nil
        }
      ]
    end

    it "accepts valid attributes" do
      valid_attributes.each do |a|
        expect(ConsentNotification.new(a)).to be_valid
      end
    end

    it "rejects invalid attributes" do
      invalid_attributes.each do |a|
        expect(ConsentNotification.new(a)).not_to be_valid
      end
    end
  end
end
