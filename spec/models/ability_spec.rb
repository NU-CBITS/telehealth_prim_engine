require "rails_helper"

RSpec.describe Ability do
  describe "User permissions" do
    def superuser
      Ability.new(TelehealthPrimEngine::User.new(superuser: true))
    end

    describe "Superusers" do
      it "can manage all models" do
        expect(superuser.can?(:manage, :all)).to eq true
      end
    end
  end
end
