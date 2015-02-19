require "rails_helper"

module TelehealthPrimEngine
  RSpec.describe Ability do
    describe "User permissions" do
      def superuser
        Ability.new(User.new(superuser: true))
      end

      def researcher
        Ability.new(User.new(researcher: true))
      end

      describe "Superusers" do
        it "can manage all models" do
          expect(superuser.can?(:manage, :all)).to eq true
        end
      end

      describe "Researchers" do
        it "can read Participants" do
          expect(researcher.can?(:read, Participant)).to eq true
        end
      end
    end
  end
end
