class PcdmBase < ActiveFedora::Base

  MANAGED_VERSIONABLE = {versionable: true, control_group: 'M'}.freeze


  has_metadata MANAGED_VERSIONABLE.merge(name: 'DC', type: DCMetadata)
  has_metadata MANAGED_VERSIONABLE.merge(name: "RELS-EXT", type:ActiveFedora::RelsExtDatastream)
  has_metadata MANAGED_VERSIONABLE.merge(name: "descMetadata", type:ActiveFedora::NtriplesRDFDatastream)

  belongs_to :container, property: :ldp_contained_by, inverse_of: :ldp_contains, class_name: 'AdministrativeSet'

  has_many :aggregators, property: :pcdm_member_of, class_name: 'ActiveFedora::Base'

end