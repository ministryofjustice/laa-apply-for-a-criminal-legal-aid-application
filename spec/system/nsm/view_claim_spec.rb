require 'rails_helper'

RSpec.describe 'View claim page', type: :system do
  let(:claim) { create(:claim, :firm_details, :letters_calls, work_items:, disbursements:) }
  let(:work_items) do
    [
      build(:work_item, :attendance_without_counsel, time_spent: 90, completed_on: 1.day.ago),
      build(:work_item, :advocacy, time_spent: 104, completed_on: 1.day.ago),
      build(:work_item, :advocacy, time_spent: 86, completed_on: 2.days.ago),
      build(:work_item, :waiting, time_spent: 23, completed_on: 3.days.ago),
    ]
  end
  let(:disbursements) do
    [
      build(:disbursement, :valid, :car, age: 5, miles: 200),
      build(:disbursement, :valid_other, :dna_testing, age: 3, total_cost_without_vat: 30),
      build(:disbursement, :valid_other, age: 3, other_type: 'Custom', total_cost_without_vat: 40),
      build(:disbursement, :valid, :car, age: 2, miles: 150),
    ]
  end

  before do
    visit provider_saml_omniauth_callback_path
  end

  it 'shows a cost summary on the main page' do
    visit nsm_steps_view_claim_path(claim.id)

    within('#cost-summary-table') do
      expect(page).to have_content('Item Net cost VAT Total')
        .and have_content('Profit costs £305.84 £61.17 £367.01')
        .and have_content('Waiting £10.58 £2.12 £12.70')
        .and have_content('Travel £0.00 £0.00 £0.00')
        .and have_content('Disbursements £227.50 £31.50 £259.00')
        .and have_content('Total £543.92 £94.78 £638.70')
    end
  end

  it 'shows a cost summary on the claim costs page' do
    visit nsm_steps_view_claim_path(claim.id, section: :claimed_costs)

    within('#cost-summary-table') do
      expect(page).to have_content('Item Net cost VAT Total')
        .and have_content('Profit costs £305.84 £61.17 £367.01')
        .and have_content('Waiting £10.58 £2.12 £12.70')
        .and have_content('Travel £0.00 £0.00 £0.00')
        .and have_content('Disbursements £227.50 £31.50 £259.00')
        .and have_content('Total £543.92 £94.78 £638.70')
    end
  end

  it 'show the work items and summary' do
    visit work_items_nsm_steps_view_claim_path(claim.id)

    # items
    expect(all('table caption, table td, table th').map(&:text)).to eq(
      [
        3.days.ago.strftime('%-d %B %Y'),
        'Item', 'Time claimed', 'Uplift claimed', 'Net cost claimed', 'Action',
        'Waiting', '0 hours 23 minutes', '10%', '£10.58', 'View',

        2.days.ago.strftime('%-d %B %Y'),
        'Item', 'Time claimed', 'Uplift claimed', 'Net cost claimed', 'Action',
        'Advocacy', '1 hour 26 minutes', '0%', '£93.77', 'View',

        1.day.ago.strftime('%-d %B %Y'),
        'Item', 'Time claimed', 'Uplift claimed', 'Net cost claimed', 'Action',
        'Advocacy', '1 hour 44 minutes', '0%', '£113.39', 'View',
        'Attendance without counsel', '1 hour 30 minutes', '0%', '£78.23', 'View'
      ]
    )

    # summary
    find('details').click
    expect(all('details table td, details table th').map(&:text)).to eq(
      [
        'Item', 'Net cost claimed', 'VAT on claimed', 'Total claimed',
        'Advocacy', '£207.16', '£0.00', '£207.16',
        'Attendance without counsel', '£78.23', '£0.00', '£78.23',
        'Waiting', '£10.58', '£0.00', '£10.58'
      ]
    )
  end

  it 'show the letters and calls page' do
    visit letters_and_calls_nsm_steps_view_claim_path(claim.id)

    expect(all('table caption, table td, table th').map(&:text)).to eq(
      [
        'Item', 'Number claimed', 'Uplift claimed', 'Net cost claimed', 'Action',
        'Letters', '2', '0%', '£8.18', 'View',
        'Calls', '3', '0%', '£12.27', 'View'
      ]
    )
  end

  it 'show the disbursements page' do
    visit disbursements_nsm_steps_view_claim_path(claim.id)

    expect(all('table caption, table td, table th').map(&:text)).to eq(
      [
        5.days.ago.strftime('%-d %B %Y'),
        'Item', 'Net cost claimed', 'VAT on claimed', 'Total claimed', 'Action',
        'Car', '£90.00', '£18.00', '£108.00', 'View',

        3.days.ago.strftime('%-d %B %Y'),
        'Item', 'Net cost claimed', 'VAT on claimed', 'Total claimed', 'Action',
        'DNA Testing', '£30.00', '£0.00', '£30.00', 'View',
        'Custom', '£40.00', '£0.00', '£40.00', 'View',

        2.days.ago.strftime('%-d %B %Y'),
        'Item', 'Net cost claimed', 'VAT on claimed', 'Total claimed', 'Action',
        'Car', '£67.50', '£13.50', '£81.00', 'View'
      ]
    )
  end
end
