module BaseCrm
  class Deal < ApiClient::Resource::Base

    include BaseCrm::Resource

    namespace "deal"

    prefix    "api/v1"

    always do
      endpoint BaseCrm.config.endpoints.sales
    end

    def source
      Source.find(self.source_id)
    rescue ApiClient::Errors::NotFound
    end

    def contact
      Contact.find(self.entity_id)
    rescue ApiClient::Errors::NotFound
    end

    def contacts
      pass_headers(Contact).fetch_for_deal(self)
    end

  end
end
