module Ore
  module Terms
    module Aggregations
      extend ActiveSupport::Concern
      included do
        has_many :aggregates, inverse_of: :pcdm_member_of, property: :pcdm_has_member
      end
    end
  end
end
