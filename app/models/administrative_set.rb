class AdministrativeSet < PcdmBase
  include Pcdm::Models
  has_many :resources, property: :ldp_contains, class_name: 'ActiveFedora::Base'
end