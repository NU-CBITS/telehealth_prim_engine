require "rails_helper"

module TelehealthPrimEngine
  RSpec.describe AdminsController, type: :controller do
    describe "GET show" do
      fixtures :all

      before :each do
        # use routes relative to the engine
        @routes = Engine.routes
      end

      context "for visitors" do
        it "redirects" do
          get :show

          expect(response).to redirect_to(new_user_session_url)
        end
      end

      context "for authenticated researchers" do
        it "renders the show template" do
          sign_in :user, telehealth_prim_engine_users(:researcher1)
          get :show

          expect(response).to render_template("show")
        end
      end
    end
  end
end
