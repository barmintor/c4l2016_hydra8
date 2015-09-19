class StructMetadata < ActiveFedora::NokogiriDatastream
  def self.xml_template

    Nokogiri::XML::Document.parse(<<-src
<mets:structMap TYPE="logical" LABEL="Sequence" xmlns:mets="http://www.loc.gov/METS/">
</mets:structMap>
src
)
end