require 'spec_helper'

describe 'pdf_meta module' do

  let(:config)    { {} }
  let(:file_path) { File.join(File.expand_path(File.dirname(__FILE__)), 'support', 'test.pdf')}

  describe 'with poppler' do

    it 'poppler should be available' do
      PDFMeta.available?.must_equal true 
    end

    it 'should return a correctly formed PDFMeta::Results object with a path' do
      PDFMeta.read(file_path).must_be_instance_of PDFMeta::Results
    end

    it 'should return a correctly formed PDFMeta::Results objects with a file object' do
      PDFMeta.read(File.open(file_path)).must_be_instance_of PDFMeta::Results
    end

  end

  describe 'without poppler' do

    let(:config) { { command_path: 'undefined' } }
    before do
      PDFMeta.configure do |c|
        c[:command_path] = config[:command_path]
      end  
    end

    after do
      PDFMeta.configure
    end

    it 'poppler should not be available' do
      PDFMeta.available?.must_equal false 
    end

    it 'should raise an error when trying to execute' do
      -> { PDFMeta.read(file_path) }.must_raise PDFMeta::PopplerMissingError
    end
  end

end
