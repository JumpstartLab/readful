describe "Creating a poll" do 
  it "works with valid attributes" do
    expect(Poll.count).to eq 0
    visit new_poll_path
    fill_in "title", :with => "My Sample Poll"
    fill_in "description", :with => "A Sample Description"
    fill_in "minimum_votes", :with => 3
    click_link_or_button 'submit'
    expect(Poll.count).to eq 1
  end
end
