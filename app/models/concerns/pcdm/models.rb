module Pcdm::Models
  extend ActiveSupport::Concern
  CMODEL_NAMESPACE = 'pcdm'
  module ClassMethods
    def pcdm_object?
      false
    end
    # Takes a Fedora URI for a cModel, and returns a 
    # corresponding Model if available
    # This method should reverse ClassMethods#to_class_uri
    # @return [Class, False] the class of the model or false, if it does not exist
    def from_class_uri(uri)
      model_value, pid_ns = classname_from_uri(uri)
      raise "model URI incorrectly formatted: #{uri}" unless model_value

      unless class_exists?(model_value)
        ActiveFedora::Base.logger.warn "#{model_value} is not a real class" if ActiveFedora::Base.logger
        return false
      end
      result = ActiveFedora.class_from_string(model_value)
      unless result.nil?
        model_ns = (result.respond_to? :pid_namespace) ? result.pid_namespace : Pcdm::Models::CMODEL_NAMESPACE
        if model_ns != pid_ns
          ActiveFedora::Base.logger.warn "Model class namespace '#{model_ns}' does not match uri: '#{uri}'" if ActiveFedora::Base.logger
        end
      end
      result
    end
    def to_class_uri
      "info:fedora/#{Pcdm::Models::CMODEL_NAMESPACE}:#{self.name.split('::').last}"
    end
  end
end
