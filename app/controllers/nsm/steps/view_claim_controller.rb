# frozen_string_literal: true

module Nsm
  module Steps
    class ViewClaimController < Nsm::Steps::BaseController
      before_action :set_section_and_scope
      before_action :set_default_table_sort_options

      def show
        @report = CheckAnswers::ReadOnlyReport.new(current_application)
        @claim = current_application
        @work_items = Sorters::WorkItemsSorter.call(current_application.work_items, @sort_by, @sort_direction)
      end

      def item
        @claim = current_application

        render report_params[:item_type]
      end

      def claimed_work_items
        @report = CheckAnswers::ReadOnlyReport.new(current_application)
        @claim = current_application
        @work_items = Sorters::WorkItemsSorter.call(current_application.work_items, @sort_by, @sort_direction)

        render 'nsm/steps/view_claim/show'
      end

      def adjusted_work_items
        @report = CheckAnswers::ReadOnlyReport.new(current_application)
        @claim = current_application
        @work_items = Sorters::WorkItemsSorter.call(current_application.work_items, @sort_by, @sort_direction)

        render 'nsm/steps/view_claim/show'
      end

      def claimed_letters_and_calls
        @report = CheckAnswers::ReadOnlyReport.new(current_application)
        @claim = current_application

        render 'nsm/steps/view_claim/show'
      end

      def adjusted_letters_and_calls
        @report = CheckAnswers::ReadOnlyReport.new(current_application)
        @claim = current_application

        render 'nsm/steps/view_claim/show'
      end

      def claimed_disbursements
        @report = CheckAnswers::ReadOnlyReport.new(current_application)
        @claim = current_application
        @disbursements = Sorters::DisbursementsSorter.call(
          current_application.disbursements.by_age, @sort_by, @sort_direction
        )

        render 'nsm/steps/view_claim/show'
      end

      def adjusted_disbursements
        @report = CheckAnswers::ReadOnlyReport.new(current_application)
        @claim = current_application
        @disbursements = Sorters::DisbursementsSorter.call(
          current_application.disbursements.by_age, @sort_by, @sort_direction
        )

        render 'nsm/steps/view_claim/show'
      end

      private

      def report_params
        params.permit(
          :id,
          :item_id,
          :item_type,
          :page,
          :sort_by,
          :sort_direction,
        )
      end

      def set_default_table_sort_options
        default = 'line_item'
        @sort_by = report_params.fetch(:sort_by, default)
        @sort_direction = report_params.fetch(:sort_direction, 'ascending')
      end

      def set_section_and_scope
        action = params[:action]
        @scope = :work_items
        @section = :overview

        case action
        when /^claimed_(.*)/
          @section = :claimed_costs
          @scope = ::Regexp.last_match(1).to_sym
        when /^adjusted_(.*)/
          @section = :adjustments
          @scope = ::Regexp.last_match(1).to_sym
        end
      end
    end
  end
end
