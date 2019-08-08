# frozen_string_literal: true

require 'date'
require 'forwardable'
require 'koine/attributes'

module Entities
  class Base
    include Koine::Attributes

    def to_h
      attributes.to_h
    end
  end
end
