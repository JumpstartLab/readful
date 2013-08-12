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

end
