require 'spec_helper'

describe Poll do
  let(:data){ {:title => "Hello Poll", :description => "This is a poll description.", :minimum_votes => 2} }

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

  it "defaults to open" do
    poll = Poll.new
    expect(poll).to be_open
  end

  it "closes" do
    poll = Poll.create(data)
    poll.close
    expect(poll).to be_closed
  end

  context "when closing" do
    it "marks any option with sufficient votes as approved" do
      poll = Poll.create(data)
      option_1 = poll.options.create( {:title => "Passionate Programmer", :note => "It is short"} )
      option_2 = poll.options.create( {:title => "Pragmatic Programmer", :note => "It is short"} )
      2.times{ option_1.votes.create }
      poll.close
      expect(option_1).to be_accepted
      expect(option_2).to_not be_accepted
    end
  end
end
