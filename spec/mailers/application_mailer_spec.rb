# frozen_string_literal: true

# spec/mailers/application_mailer_spec.rb

require 'rails_helper'

RSpec.describe ApplicationMailer, type: :mailer do
  describe 'sample_email' do
    let(:user) { create(:user, email: 'mailto:nika@mailinator.com') }

    it 'sends a sample email' do
      #   # You can customize this with your actual mailer method and parameters
      #   email = ApplicationMailer.sample_email(user).deliver_now

      #   # Test email properties
      #   expect(email.from).to mailto:eq(['from@example.com'])
      #   expect(email.to).to mailto:eq(['recipient@example.com'])
      #   expect(email.subject).to eq('Your Subject Here')

      #   # Test email body, assuming plain text email
      #   expect(email.body).to include('Hello, this is a sample email body.')
    end
  end
end
