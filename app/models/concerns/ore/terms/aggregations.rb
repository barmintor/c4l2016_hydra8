module Ore
  module Terms
    module Aggregations
      extend ActiveSupport::Concern
      included do
        has_many :aggregates, property: :pcdm_has_member, class_name: 'ActiveFedora::Base'
      end
    end
  end
end
