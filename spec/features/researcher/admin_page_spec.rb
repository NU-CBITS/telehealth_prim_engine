require "rails_helper"

RSpec.feature "Researcher using Home Page", type: :feature do
  fixtures :all

  scenario "sees that consent form notifications were sent" do
    section = ResearcherAdminSection.new(self).sign_in_and_visit

    section.consent_form_notification? :participant1
  end
end

class ResearcherAdminSection
  def initialize(example)
    @example = example
  end

  def sign_in_and_visit
    @example.sign_in :user, user(:researcher5), "humpty dump+y sat on a w411"
    @example.visit "/admin"

    self
  end

  def consent_form_notification?(participant_name)
    participant_id = participant(participant_name).id

    @example.instance_eval do
      expect(page).to have_css(
        "##{ participant_id } .consent-notification .sent"
      )
    end
  end

  private

  def user(name)
    @example.send(:telehealth_prim_engine_users, name)
  end

  def participant(name)
    @example.send(:telehealth_prim_engine_participants, name)
  end
end
