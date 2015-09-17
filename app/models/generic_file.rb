class GenericFile < PcdmBase
  include Pcdm::Models::Objects

  has_file_datastream PcdmBase::MANAGED_VERSIONABLE.merge(name: "content")

end