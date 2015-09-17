require 'spec_helper'

describe Collection, type: :unit do
  before(:all) do

  end
  context "is instantiated" do
    let(:object) { Collection.new }
    describe "the DC datastream" do
      subject { object.datastreams['DC']}
      it do
        expect(subject.controlGroup).to eql('M')
        is_expected.to be_a DCMetadata
      end
    end
    describe "the RELS-EXT datastream" do
      subject { object.rels_ext}
      it do
        expect(subject.controlGroup).to eql('M')
        is_expected.to be_a ActiveFedora::RelsExtDatastream
      end
    end
  end
  describe '.pcdm_object?' do
    subject {Collection.pcdm_object?}
    it { is_expected.not_to be }
  end
  describe '.to_class_uri' do
    let(:to_class_uri) { Collection.to_class_uri }
    subject { to_class_uri }
    it do
      is_expected.to eql("info:fedora/pcdm:Collection")
    end
    context "is used as the value to look up the name of the model class" do
      subject { ActiveFedora::Model.classname_from_uri(to_class_uri) }
      it do
        is_expected.to eql ['Collection', 'pcdm']
      end
    end
    context "is used as the value to look up the model class" do
      subject { ActiveFedora::ContentModel.uri_to_model_class(to_class_uri) }
      it do
        is_expected.to be Collection
      end
    end
  end
end
