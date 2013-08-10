describe "Creating a poll" do 
  it "works with valid attributes" do
    expect(Poll.count).to eq 0
    visit new_poll_path
    fill_in "title", :with => "My Sample Poll"
    fill_in "description", :with => "A Sample Description"
    click_link_or_button 'submit'
    expect(Poll.count).to eq 1
  end

end

describe "adding options" do
  let(:data){ {:title => "Hello Poll", :description => "This is a poll description."} }

  let!(:poll){ Poll.create(data) }

  it "adds an option to an existing poll" do
    visit poll_path(poll)
    click_link_or_button "add_option"
    fill_in 'title', :with => "The Passionate Programmer"
    fill_in 'note', :with => "It's great!"
    fill_in 'url', :with => "http://amazon.com/passionate"
    click_link_or_button "submit"
    expect(current_path).to eq poll_path(poll)
    within('#options') do
      expect(page).to have_content('The Passionate Programmer')
    end
  end
end