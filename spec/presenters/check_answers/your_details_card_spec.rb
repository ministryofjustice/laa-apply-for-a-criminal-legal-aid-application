require 'rails_helper'

RSpec.describe CheckAnswers::YourDetailsCard do
  subject { described_class.new(claim) }

  let(:claim) { instance_double(Claim) }
  let(:form) do
    instance_double(Steps::FirmDetailsForm, firm_office:, solicitor:)
  end
  let(:firm_office) do
    instance_double(Steps::FirmDetails::FirmOfficeForm, name: firm_name,
    account_number: firm_account_number, address_line_1: firm_address_1, address_line_2: firm_address_2,
    town: firm_town, postcode: firm_postcode)
  end
  let(:solicitor) do
    instance_double(Steps::FirmDetails::SolicitorForm, full_name: solicitor_full_name,
    reference_number: solicitor_ref_number)
  end
  let(:firm_name) { 'Firm A' }
  let(:firm_account_number) { '123ABC' }
  let(:firm_address_1) { '2 Laywer Suite' }
  let(:firm_address_2) { 'Unit B' }
  let(:firm_town) { 'Lawyer Town' }
  let(:firm_postcode) { 'CR0 1RE' }
  let(:solicitor_full_name) { 'Richard Jenkins' }
  let(:solicitor_ref_number) { '111222' }

  before do
    allow(Steps::FirmDetailsForm).to receive(:build).and_return(form)
  end

  describe '#initialize' do
    it 'creates the data instance' do
      subject
      expect(Steps::FirmDetailsForm).to have_received(:build).with(claim)
    end
  end

  describe '#title' do
    it 'shows correct title' do
      expect(subject.title).to eq('Your Details')
    end
  end

  describe '#route_path' do
    it 'is correct route' do
      expect(subject.route_path).to eq('firm_details')
    end
  end

  describe '#rows' do
    context '2 lines in address' do
      it 'generates case detail rows with 2 lines of address' do
        expect(subject.rows).to eq(
          [
            {
              key: { text: 'Firm name', classes: 'govuk-summary-list__value-width-50' },
              value: { text: 'Firm A' }
            },
            {
              key: { text: 'Firm account number', classes: 'govuk-summary-list__value-width-50' },
              value: { text: '123ABC' }
            },
            {
              key: { text: 'Firm address', classes: 'govuk-summary-list__value-width-50' },
              value: { text: '2 Laywer Suite<br>Unit B<br>Lawyer Town<br>CR0 1RE' }
            },
            {
              key: { text: 'Solicitor full name', classes: 'govuk-summary-list__value-width-50' },
              value: { text: 'Richard Jenkins' }
            },
            {
              key: { text: 'Solicitor reference number', classes: 'govuk-summary-list__value-width-50' },
              value: { text: '111222' }
            }
          ]
        )
      end
    end

    context '1 line in address' do
      let(:firm_address_2) { nil }

      it 'generates case detail rows with 1 line of address' do
        expect(subject.rows).to eq(
          [
            {
              key: { text: 'Firm name', classes: 'govuk-summary-list__value-width-50' },
              value: { text: 'Firm A' }
            },
            {
              key: { text: 'Firm account number', classes: 'govuk-summary-list__value-width-50' },
              value: { text: '123ABC' }
            },
            {
              key: { text: 'Firm address', classes: 'govuk-summary-list__value-width-50' },
              value: { text: '2 Laywer Suite<br>Lawyer Town<br>CR0 1RE' }
            },
            {
              key: { text: 'Solicitor full name', classes: 'govuk-summary-list__value-width-50' },
              value: { text: 'Richard Jenkins' }
            },
            {
              key: { text: 'Solicitor reference number', classes: 'govuk-summary-list__value-width-50' },
              value: { text: '111222' }
            }
          ]
        )
      end
    end
  end
end
