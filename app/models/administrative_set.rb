class AdministrativeSet < PcdmBase
  include Pcdm::Models
  has_many :resources, property: :ldp_contains
end