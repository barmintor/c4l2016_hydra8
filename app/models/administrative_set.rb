class AdministrativeSet < PcdmBase
  include Pcdm::Models
  has_many :resources, property: :has_constituent, class_name: 'ActiveFedora::Base'
end