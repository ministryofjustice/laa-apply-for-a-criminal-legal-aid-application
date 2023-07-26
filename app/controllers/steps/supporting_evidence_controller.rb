# frozen_string_literal: true

module Steps
  class SupportingEvidenceController < Steps::BaseStepController
    skip_before_action :verify_authenticity_token
    before_action :supporting_evidence
    def edit
      @form_object = SupportingEvidenceForm.build(
        current_application
      )
    end

    def create
      evidence = SupportingEvidence.create(
        file_name: params[:documents].original_filename,
        file_type: params[:documents].content_type,
        file_size: params[:documents].tempfile.size,
        claim: current_application,
        file: params[:documents]
      )

      render json: {
        fileId: evidence.id
      }, status: :ok
    end

    def update
      update_and_advance(SupportingEvidenceForm, as: :supporting_evidence)
    end

    def destroy
      SupportingEvidence.destroy(params[:resource_id])
    rescue StandardError => e
      Sentry.capture_exception(e)
      render json: {}, status: :bad_request
    end

    private

    def decision_tree_class
      Decisions::DslDecisionTree
    end

    def supporting_evidence
      @supporting_evidence = latest_evidence.nil? ? SupportingEvidence.new : latest_evidence
    end

    def latest_evidence
      SupportingEvidence.where(claim_id: current_application.id)&.map
    end
  end
end
