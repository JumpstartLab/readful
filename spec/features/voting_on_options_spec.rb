describe "voting on options" do 
  let(:poll_data){ {:title => "Hello Poll", :description => "This is a poll description."} }

  let(:poll){ Poll.create(poll_data) }
  (0..2).each do |index|
    let!("option_#{index}"){ poll.options.create({:title => "My Option #{index}", :url => 'http://amazon.com', :note => "Short Note"}) }
  end

  it "submits a vote on a single option" do
    visit poll_path(poll)
    within("#option-#{option_0.id}") do
      expect(page).to have_content("Votes: 0")
      click_link_or_button "plus_one-option_#{option_0.id}"
    end
    within("#option-#{option_0.id}") do
      expect(current_path).to eq poll_path(poll)
      within(".votes") do
        expect(page).to have_content("1")
      end
    end
  end

  it "votes multiple times on an option" do
    visit poll_path(poll)
    within("#option-#{option_0.id}") do
      expect(page).to have_content("Votes: 0")      
    end
    3.times{ click_link_or_button "plus_one-option_#{option_0.id}" }
    
    within("#option-#{option_0.id}") do
      expect(current_path).to eq poll_path(poll)
      within(".votes") do
        expect(page).to have_content("3")
      end
    end
  end
end