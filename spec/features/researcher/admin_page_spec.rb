require "rails_helper"

RSpec.feature "researcher admin page", type: :feature do
  fixtures :all

  def user(name)
    telehealth_prim_engine_users(name)
  end

  def participant(name)
    telehealth_prim_engine_participants(name)
  end

  scenario "sees that consent form notifications were sent" do
    sign_in :user, user(:researcher5), "humpty dump+y sat on a w411"
    section = ResearcherAdminSection.new(self).visit

    section.consent_form_notification? participant(:participant1)
  end
end

class ResearcherAdminSection
  def initialize(example)
    @example = example
  end

  def visit
    @example.visit "/admin"

    self
  end

  def consent_form_notification?(participant)
    @example.instance_eval do
      expect(page).to have_css(
        "##{ participant.id } .consent-notification .sent"
      )
    end
  end
end
