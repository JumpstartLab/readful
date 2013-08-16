require 'spec_helper'

describe "the listing of polls" do
  let(:poll_data){ {:title => "Hello Poll", :description => "This is a poll description.", :minimum_votes => 3} }
  let!(:poll){ Poll.create(poll_data) }

  it "shows active polls" do  
    visit polls_path
    within("#poll_#{poll.id}") do
      expect(page).to have_content(poll.title)
    end
  end

  it "hides inactive polls" do
    inactive_data = poll_data.merge(:title => "Closed Poll")
    inactive = Poll.create(inactive_data)
    inactive.close
    visit polls_path
    expect(page).to_not have_css("#poll_#{inactive.id}")
  end
end