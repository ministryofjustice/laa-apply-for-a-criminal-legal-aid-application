require 'system_helper'

RSpec.describe 'Prior authority applications - add hearing details' do
  before do
    fill_in_until_step(:hearing_detail)
  end

  it 'allows hearing detail creation' do
    expect(page).to have_title 'Hearing details'

    within('.govuk-form-group', text: 'Date of next hearing') do
      dt = Date.tomorrow
      fill_in 'Day', with: dt.day
      fill_in 'Month', with: dt.month
      fill_in 'Year', with: dt.year
    end

    choose 'Not guilty'
    choose 'Central Criminal Court'

    click_on 'Save and continue'
    expect(page).to have_title 'Have you accessed the psychiatric liaison service?'
  end

  context 'when navigating to next page' do
    before do
      within('.govuk-form-group', text: 'Date of next hearing') do
        dt = Date.tomorrow
        fill_in 'Day', with: dt.day
        fill_in 'Month', with: dt.month
        fill_in 'Year', with: dt.year
      end

      choose 'Not guilty'
    end

    context "with magistrate's court chosen" do
      it 'moves to Youth court page' do
        choose  "Magistrate's court"

        click_on 'Save and continue'
        expect(page).to have_title 'Is this a youth court matter?'
      end
    end

    context 'with Central criminal court chosen' do
      it 'moves to Psychiatric liaison page' do
        choose  'Central Criminal Court'

        click_on 'Save and continue'
        expect(page).to have_title 'Have you accessed the psychiatric liaison service?'
      end
    end

    context 'with Crown Court (excluding Central Criminal Court) chosen' do
      it 'moves to Your application progress page' do
        choose  'Crown Court (excluding Central Criminal Court)'

        click_on 'Save and continue'
        expect(page).to have_title 'Your application progress'
      end
    end
  end

  it 'validates hearing detail fields' do
    click_on 'Save and continue'
    expect(page)
      .to have_content('Date cannot be blank')
      .and have_content('Select the likely or actual plea')
      .and have_content('Select the type of court')
  end

  it 'allows save and come back later' do
    click_on 'Save and come back later'
    expect(page).to have_content('Case and hearing detailsIn progress')
  end
end
