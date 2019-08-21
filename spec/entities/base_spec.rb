# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Entities::Base do
  it 'includes the koine attributes module' do
    expect(described_class.ancestors).to include(Koine::Attributes)
  end
end
