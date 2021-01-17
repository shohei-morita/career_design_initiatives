require 'rails_helper'

RSpec.describe RegistrationMailer, type: :mailer do
  describe 'approval' do
    let(:mail) { RegistrationMailer.approval }

    it 'renders the headers' do
      expect(mail.subject).to eq('Approval')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
