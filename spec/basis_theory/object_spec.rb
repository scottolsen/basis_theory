# frozen_string_literal: true

RSpec.describe BasisTheory::Object do
  it 'creates an object from a hash' do
    object = described_class.new(foo: 'bar')

    expect(object.foo).to eq('bar')
  end

  it 'creates an object from a nested hash' do
    object = described_class.new(foo: { bar: { baz: 'ding' } })

    expect(object.foo.bar.baz).to eq('ding')
  end

  it 'creates an object from an array' do
    object = described_class.new(foo: [{ bar: 'baz' }])

    expect(object.foo.first.bar).to eq('baz')
  end
end
