module Nsm
  module Steps
    class DisbursementCostForm < ::Steps::BaseFormObject
      include DisbursementCosts
      attr_writer :apply_vat

      attribute :miles, :fully_validatable_decimal, precision: 10, scale: 3
      attribute :total_cost_without_vat, :gbp
      attribute :details, :string
      attribute :prior_authority, :value_object, source: YesNoAnswer

      validates :miles, presence: true, is_a_decimal: { greater_than: 0 }, unless: :other_disbursement_type?
      validates :total_cost_without_vat, presence: true, numericality: { greater_than: 0 }, is_a_number: true,
                                         if: :other_disbursement_type?
      validates :details, presence: true
      validates :prior_authority, presence: true, inclusion: { in: YesNoAnswer.values }, if: :other_disbursement_type?

      def apply_vat
        @apply_vat.nil? ? record.vat_amount.to_f.positive? : @apply_vat == 'true'
      end

      # rubocop:disable Metrics/MethodLength
      def calculation_rows
        # this logic is needed to prevent invalid values erroring in the NumberTo methods
        if total_cost_pre_vat.is_a?(String)
          record.errors.add(:total_cost_without_vat, :not_a_decimal)
          []
        else
          [
            [translate(:before_vat), translate(:after_vat)],
            [{
              text: NumberTo.pounds(total_cost_pre_vat),
              html_attributes: { id: 'total-without-vat' }
            },
             {
               text: NumberTo.pounds(total_cost),
               html_attributes: { id: 'total-with-vat' },
             }],
          ]
        end
      end
      # rubocop:enable Metrics/MethodLength

      private

      def translate(key)
        I18n.t("nsm.steps.disbursement_cost.edit.#{key}")
      end

      def persist!
        record.update!(attributes_with_resets)
      end

      def attributes_with_resets
        attributes.merge(
          'miles' => other_disbursement_type? ? nil : miles,
          'prior_authority' => other_disbursement_type? ? prior_authority : nil,
          'total_cost_without_vat' => total_cost_pre_vat,
          'vat_amount' => vat,
          'apply_vat' => apply_vat ? 'true' : 'false'
        )
      end
    end
  end
end
