require 'spec_helper'

describe Poll do
  let(:data){ {:title => "Hello Poll", :description => "This is a poll description."} }

  it "is valid with valid attributes" do
    poll = Poll.new(data)
    expect(poll).to be_valid
  end

  it "is not valid without a title" do
    poll_data = data.merge({:title => nil})
    poll = Poll.new(poll_data)
    expect(poll).to_not be_valid
  end

  it "is not valid without a description" do
    poll_data = data.merge({:description => nil})
    poll = Poll.new(poll_data)
    expect(poll).to_not be_valid
  end
end
