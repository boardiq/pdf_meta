require 'spec_helper'

describe 'parser' do
  let(:output) { "" }
  let(:parser) { PDFMeta::Parser.new(output) }

  describe 'with incomplete data' do
    let(:output) do
<<-EOF
Title:          Hello: This is a test with a colon
Author:
Creator:        Adobe InDesign CS5.5 (7.5.1)
Producer:
CreationDate:   Thu Sep 12 00:20:46 2013
ModDate:        Thu Sep 12 00:22:14 2013
Tagged:         no
UserProperties: no
Suspects:       no
Form:           none
JavaScript:     no
Pages:          1
Encrypted:      no
Page size:      269.291 x 269.291 pts
Page rot:       0
File size:      470135 bytes
Optimized:      no
PDF version:    1.7
EOF
    end

    it 'should parse into a results object' do
      parser.results.must_be_instance_of PDFMeta::Results
    end

    it 'should have a nil author' do
      parser.results.author.must_be_nil
    end

    it 'should have a nil producer' do
      parser.results.producer.must_be_nil
    end

  end

  describe 'with extra linebreaks' do
    let(:output) do
<<-EOF
Title:          CC29 Conflicts of interest A guide for charity trustees
Subject:        A PDF, print friendly version of our online guidance, setting out what trustees need to do to identify and respond to any conflicts of interest which come up at their charity.

Author:         Charity Commission
Creator:        Adobe InDesign CS5.5 (7.5.3)
Producer:       GPL Ghostscript 9.15
CreationDate:   Thu Jul  2 09:00:44 2015
ModDate:        Thu Jul  2 09:00:44 2015
Tagged:         no
UserProperties: no
Suspects:       no
Form:           none
JavaScript:     no
Pages:          32
Encrypted:      no
Page size:      595.276 x 841.89 pts (A4)
Page rot:       0
File size:      317730 bytes
Optimized:      no
PDF version:    1.5
EOF
    end

    it 'should parse into a results object' do
      parser.results.must_be_instance_of PDFMeta::Results
    end

  end


  describe 'with complete data' do
    let(:output) do
<<-EOF
Title:          Hello: This is a test with a colon
Author:         Apple Inc.
Creator:        Adobe InDesign CS5.5 (7.5.1)
Producer:       Adobe PDF Library 9.9
CreationDate:   Thu Sep 12 00:20:46 2013
ModDate:        Thu Sep 12 00:22:14 2013
Tagged:         no
UserProperties: no
Suspects:       no
Form:           none
JavaScript:     no
Pages:          1
Encrypted:      no
Page size:      269.291 x 269.291 pts
Page rot:       0
File size:      470135 bytes
Optimized:      no
PDF version:    1.7
EOF
    end

    it 'should parse into a results object' do
      parser.results.must_be_instance_of PDFMeta::Results
    end

    it 'should make the title available' do
      parser.results.title.must_equal "Hello: This is a test with a colon"
    end
  end

end