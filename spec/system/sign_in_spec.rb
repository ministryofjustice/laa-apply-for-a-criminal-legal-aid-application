require 'rails_helper'

RSpec.describe 'Sign in user journey' do
  context 'user is not signed in' do
    it 'redirects to the login page' do
      visit '/'
      expect(current_url).to match('/login')
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end
  end

  context 'user signs in but is not yet enrolled' do
    before do
      allow(
        OmniAuth.config
      ).to receive(:mock_auth).and_return(
        saml: OmniAuth::AuthHash.new(info: { office_codes: ['1X000X'] })
      )
      visit provider_saml_omniauth_callback_path
    end

    it 'redirects to the error page' do
      expect(current_url).to match(laa_msf.not_enrolled_errors_path)
      expect(page).to have_content('Your account cannot use this service yet')
    end
  end

  context 'user is signed in' do
    before do
      allow_any_instance_of(
        Provider
      ).to receive(:office_codes).and_return(['1A123B'])

      visit provider_saml_omniauth_callback_path
    end

    it 'authenticates the user and redirects to the dashboard' do
      expect(page).to have_current_path(root_path)
    end

    context 'when I start NSM journey' do
      before { click_on "Claim non-standard magistrates' court payments, previously CRM7" }

      it 'takes me to the application path page' do
        expect(page).to have_current_path(nsm_applications_path)
      end
    end

    context 'when I start PA journey' do
      before { click_on 'Apply for prior authority to incur disbursements, previously CRM4' }

      it 'takes me to the application path page' do
        expect(page).to have_current_path(prior_authority_applications_path)
      end
    end
  end
end
