# frozen_string_literal: true

require 'spec_helper'

RSpec.describe HashUtils::KeySymbolizer do
  let(:deep_symbolize) do
    subject.deep_symbolize(given_hash)
  end

  describe '#deep_symbolize' do
    let(:expected_hash) do
      {
        foo_bar: 'bar',
        foo_baz: {
          bar: 'foo',
          foo: { bar_foo: 'baz' }
        }
      }
    end

    context 'with string keys' do
      let(:given_hash) do
        {
          'foo_bar' => 'bar',
          'foo_baz' => {
            'bar' => 'foo',
            'foo' => { 'bar_foo' => 'baz' }
          }
        }
      end

      it 'deep symbolize a hash' do
        expect(deep_symbolize).to eq(expected_hash)
      end
    end

    context 'with symbol keys' do
      let(:given_hash) do
        {
          fooBar: 'bar',
          fooBaz: {
            bar: 'foo',
            foo: { barFoo: 'baz' }
          }
        }
      end

      it 'it normalize the key names' do
        expect(deep_symbolize).to eq(expected_hash)
      end
    end
  end
end
