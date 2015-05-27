require 'spec_helper'

describe 'parser' do

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
  let(:parser) { PDFMeta::Parser.new(output) }

  it 'should parse into a results object' do
    parser.results.must_be_instance_of PDFMeta::Results
  end

  it 'should make the title available' do
    parser.results.title.must_equal "Hello: This is a test with a colon"
  end

end