require 'spec_helper'

describe Option do
  context "for a given poll" do
    let(:poll_data){ {:title => "Hello Poll", :description => "This is a poll description."} }
    let(:option_data){ {:title => "Passionate Programmer", :note => "It is short"} }

    it "has a unique title" do
      poll = Poll.new(poll_data)
      option_1 = poll.options.build(option_data)
      expect(option_1).to be_valid
      poll.save
      option_2 = poll.options.build(option_data)
      expect(option_2).to_not be_valid
    end

    it "can have the same title as another option in a different poll" do
      poll_1 = Poll.create(poll_data)
      poll_2 = Poll.create poll_data.merge({:title => "Second Poll"})
      option_1 = poll_1.options.create(option_data)
      option_2 = poll_2.options.build(option_data)
  
      expect(option_2).to be_valid
    end

  end
end
