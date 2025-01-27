class SubmitToAppStore
  class PayloadBuilder
    def self.call(submission)
      case submission
      when Claim, AppStore::V1::Nsm::Claim
        NsmPayloadBuilder.new(claim: submission).payload
      when PriorAuthorityApplication
        PriorAuthorityPayloadBuilder.new(application: submission).payload
      else
        raise 'Unknown submission type'
      end
    end
  end
end
