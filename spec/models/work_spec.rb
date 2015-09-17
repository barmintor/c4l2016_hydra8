require 'spec_helper'

describe Work, type: :unit do
  before(:all) do

  end
  context "is instantiated" do
    let(:object) { Work.new }
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
    subject {Work.pcdm_object?}
    it { is_expected.to be }
  end
  describe '.to_class_uri' do
    let(:to_class_uri) { Work.to_class_uri }
    subject { to_class_uri }
    it do
      is_expected.to eql("info:fedora/afmodel:Work")
    end
    context "is used as the value to look up the name of the model class" do
      subject { ActiveFedora::Model.classname_from_uri(to_class_uri) }
      it do
        is_expected.to eql ['Work', 'afmodel']
      end
    end
    context "is used as the value to look up the model class" do
      subject { ActiveFedora::ContentModel.uri_to_model_class(to_class_uri) }
      it do
        is_expected.to be Work
      end
    end
  end
end