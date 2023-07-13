module CheckAnswers
  class YourDetailsCard < Base
    attr_reader :firm_details_form

    KEY = 'firm_details'.freeze

    def initialize(claim)
      @firm_details_form = Steps::FirmDetailsForm.build(claim)
    end

    def route_path
      KEY
    end

    def title
      I18n.t('steps.check_answers.groups.about_you.your_details.title')
    end

    # TO DO: figure out best way to include br tags in row, identify where Your Full Name and Your Phone Number come from
    def rows
      [
        {
          key: { text: translate_table_key(KEY, 'firm_name'), classes: 'govuk-summary-list__value-width-50' },
          value: { text: firm_details_form.firm_office.name }
        },
        {
          key: { text: translate_table_key(KEY, 'firm_account_number'), classes: 'govuk-summary-list__value-width-50' },
          value: { text: firm_details_form.firm_office.account_number }
        },
        {
          key: { text: translate_table_key(KEY, 'firm_address'), classes: 'govuk-summary-list__value-width-50' },
          value: { text: format_address(firm_details_form.firm_office.address_line_1, firm_details_form.firm_office.address_line_2, firm_details_form.firm_office.town,
                                        firm_details_form.firm_office.postcode) }
        },
        {
          key: { text: translate_table_key(KEY, 'solicitor_full_name'), classes: 'govuk-summary-list__value-width-50' },
          value: { text: firm_details_form.solicitor.full_name }
        },
        {
          key: { text: translate_table_key(KEY, 'solicitor_reference_number'),
classes: 'govuk-summary-list__value-width-50' },
          value: { text: firm_details_form.solicitor.reference_number }
        }
      ]
    end

    private

    def format_address(address_line_1, address_line_2 = nil, town, postcode)
      "#{address_line_1}<br>#{address_line_2.present? ? "#{address_line_2}<br>" : nil}#{town}<br>#{postcode}"
    end
  end
end
