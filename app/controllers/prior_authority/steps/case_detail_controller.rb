module PriorAuthority
  module Steps
    class CaseDetailController < BaseController
      def edit
        @form_object = CaseDetailForm.build(
          current_application
        )
      end

      def update
        update_and_advance(CaseDetailForm, as:, after_commit_redirect_path:)
      end

      private

      def as
        :case_detail
      end

      def additional_permitted_params
        [
          defendant_attributes: CaseDetail::DefendantForm.attribute_names,
        ]
      end
    end
  end
end
