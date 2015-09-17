module Pcdm::Models::Objects
  extend ActiveSupport::Concern
  module ClassMethods
    def pcdm_object?
      true
    end
  end
end