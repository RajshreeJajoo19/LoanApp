
require 'rails_helper'

RSpec.describe ApplicationMailer, type: :mailer do
  describe 'default settings' do
    it 'uses the correct default "from" address' do
      expect(ApplicationMailer.default[:from]).to eq('from@example.com')
    end

    it 'uses the correct layout' do
      default_layout = ApplicationMailer.default[:layout]
      expect(default_layout).to_not be_nil, "Default layout is nil. Check your ApplicationMailer class."
      expect(default_layout).to eq('mailer')
    end
  end
end
