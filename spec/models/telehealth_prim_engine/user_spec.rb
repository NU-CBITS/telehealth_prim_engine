require "rails_helper"

module TelehealthPrimEngine
  RSpec.describe User, type: :model do
    def valid_attributes
      [
        {
          email: "foo@example.com",
          password: "I do not like gr33n eggs and ham!",
          password_confirmation: "I do not like gr33n eggs and ham!",
          superuser: false,
          researcher: true,
          content_author: true
        }
      ]
    end

    def invalid_attributes
      [
        {
          email: nil,
          password: nil,
          password_confirmation: nil,
          superuser: false,
          researcher: true,
          content_author: true
        },
        {
          email: "foo@example.com",
          password: "I do not like gr33n eggs and ham!",
          password_confirmation: "baz",
          superuser: false,
          researcher: true,
          content_author: true
        },
        {
          email: "foo@example.com",
          password: "I do not like gr33n eggs and ham!",
          password_confirmation: "I do not like gr33n eggs and ham!",
          superuser: nil,
          researcher: true,
          content_author: true
        },
        {
          email: "foo@example.com",
          password: "I do not like gr33n eggs and ham!",
          password_confirmation: "I do not like gr33n eggs and ham!",
          superuser: false,
          researcher: nil,
          content_author: true
        },
        {
          email: "foo@example.com",
          password: "I do not like gr33n eggs and ham!",
          password_confirmation: "I do not like gr33n eggs and ham!",
          superuser: false,
          researcher: true,
          content_author: nil
        }
      ]
    end

    it "accepts valid attributes" do
      valid_attributes.each { |a| expect(User.new(a)).to be_valid }
    end

    it "rejects invalid attributes" do
      invalid_attributes.each do |a|
        expect(User.new(a)).not_to be_valid
      end
    end
  end
end
