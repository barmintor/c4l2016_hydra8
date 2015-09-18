module Pcdm::Models
  extend ActiveSupport::Concern
  CMODEL_NAMESPACE = 'pcdm'.freeze
  module ClassMethods
    def pcdm_object?
      false
    end
    def pid_namespace
      Pcdm::Models::CMODEL_NAMESPACE
    end
  end
end
