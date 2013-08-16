require 'spec_helper'

describe "Closing a poll" do
  let(:poll_data){ {:title => "Hello Poll", :description => "This is a poll description.", :minimum_votes => 3} }
  let(:poll){ Poll.create(poll_data) }

  (0..5).each do |index|
    let!("option_#{index}"){ poll.options.create({:title => "My Option #{index}", :url => 'http://amazon.com', :note => "Short Note"}) }
  end

  context "when each option has enough votes" do
    before(:each) do
      poll.options.each do |option|
        3.times{ option.votes.create }
      end
    end

    it "closes without redistributing" do
      visit poll_path(poll)
      click_link_or_button 'close_poll'
      expect(current_path).to eq poll_path(poll)
      poll.options.each do |option|
        within("#option-#{option.id}") do
          expect(page).to_not have_css("#plus_one-option_#{option.id}")
          expect(page).to have_content("Accepted")
        end
      end
    end
  end

  context "when an option has insufficient votes" do
    let(:accepted){ poll.options[0..3] }
    let(:outlier){ poll.options[4] }

    before(:each) do
      accepted.each do |option|
        3.times{ option.votes.create }
      end
    end

    it "closes without redistributing" do
      visit poll_path(poll)
      click_link_or_button 'close_poll'
      expect(current_path).to eq poll_path(poll)
      accepted.each do |option|
        within("#option-#{option.id}") do
          expect(page).to_not have_css("#plus_one-option_#{option.id}")
          expect(page).to have_css(".accepted")
        end
      end

      within("#option-#{outlier.id}") do
        expect(page).to_not have_css("#plus_one-option_#{outlier.id}")
        expect(page).to have_css(".not_accepted")
      end
    end
  end

end
