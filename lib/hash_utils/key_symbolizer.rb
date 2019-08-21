# frozen_string_literal: true

module HashUtils
  class KeySymbolizer
    def deep_symbolize(hash)
      symbolized_hash = {}

      hash.each do |key, value|
        symbolized_key = symbolize_key(key)

        unless value.is_a?(Hash)
          symbolized_hash[symbolized_key] = value
          next
        end

        symbolized_hash[symbolized_key] = deep_symbolize(value)
      end

      symbolized_hash
    end

    private

    def symbolize_key(key)
      to_snake(key).to_sym
    end

    def to_snake(word)
      snake_word = word.to_s.gsub(/[A-Z]/) { |c| "_#{c.downcase}" }
      snake_word.gsub('-', '_')
    end
  end
end
