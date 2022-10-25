# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Ioki::Model::Base do
  subject(:model) { example_class.new(attributes) }

  let(:example_class) do
    Class.new(Ioki::Model::Base) do
      attribute :foo, on: :read
    end
  end

  let(:attributes) { { foo: 'bar' } }

  describe 'initializiation and configuration:' do
    it 'can get initialized with attributes' do
      expect(model._attributes).to eq(attributes)
    end
  end

  describe '#inspect' do
    it 'gives a debug representation of the object' do
      expect(model.inspect).to be_a(String)
    end
  end

  describe 'getter/setter' do
    describe 'for an attribute of type :string' do
      let(:example_class) do
        Class.new(Ioki::Model::Base) { attribute :foo, type: :string, on: :read }
      end

      it 'gives access to correctly casted values' do
        model = example_class.new
        expect(model.foo).to be_nil
        model.foo = 42
        expect(model.foo).to eq('42')
      end
    end

    describe 'parameters for attribute' do
      context 'with a use case in omit_if_nil_on: is not defined in on:' do
        let(:example_class) do
          Class.new(Ioki::Model::Base) { attribute :foo, type: :string, on: :read, omit_if_nil_on: :road }
        end

        it 'raises an ArgumentError' do
          expect { example_class }.to raise_error(ArgumentError)
        end
      end

      context 'with a use case in omit_if_blank_on: is not defined in on:' do
        let(:example_class) do
          Class.new(Ioki::Model::Base) { attribute :foo, type: :string, on: :read, omit_if_blank_on: :road }
        end

        it 'use cases in omit_if_blank_on have to match with a use case defined with on:' do
          expect { example_class }.to raise_error(ArgumentError)
        end
      end
    end

    describe 'for an attribute of type :integer' do
      let(:example_class) do
        Class.new(Ioki::Model::Base) { attribute :foo, type: :integer, on: :read }
      end

      it 'gives access to correctly casted values' do
        model = example_class.new
        expect(model.foo).to be_nil
        model.foo = '42'
        expect(model.foo).to eq(42)
      end
    end

    describe 'for an attribute of type :float' do
      let(:example_class) do
        Class.new(Ioki::Model::Base) { attribute :foo, type: :float, on: :read }
      end

      it 'gives access to correctly casted values' do
        model = example_class.new
        expect(model.foo).to be_nil
        model.foo = '12.34'
        expect(model.foo).to eq(12.34)
      end
    end

    describe 'for an attribute of type :boolean' do
      let(:example_class) do
        Class.new(Ioki::Model::Base) { attribute :foo, type: :boolean, on: :read }
      end

      it 'gives access to correctly casted values' do
        model = example_class.new
        expect(model.foo).to be_nil
        model.foo = '0'
        expect(model.foo).to be_falsy
        model.foo = 'true'
        expect(model.foo).to be_truthy
      end
    end

    describe 'for an attribute of type :date_time' do
      let(:example_class) do
        Class.new(Ioki::Model::Base) { attribute :foo, type: :date_time, on: :read }
      end

      it 'gives access to correctly casted values' do
        model = example_class.new
        expect(model.foo).to be_nil
        model.foo = '2020-01-01 12:34:56'
        expect(model.foo).to be_a(DateTime)
      end
    end

    describe 'for an attribute of type :object with a class_name' do
      let(:example_referenced_class) do
        Class.new(Ioki::Model::Base) do
          attribute :bar, type: :integer, on: :read
        end
      end

      let(:example_class) do
        Class.new(Ioki::Model::Base) do
          attribute :foo, type: :object, class_name: 'ExampleReferencedClass', on: :read
        end
      end

      before do
        # Make sure that the mock class is in the correct module.
        # Equivalent to defining it in that module.
        Ioki::Model.const_set('ExampleReferencedClass', example_referenced_class)
        Ioki::Model.const_set('ExampleObjectClassName', example_class)
      end

      after do
        # To suppress "warning: already initialized constant"
        Ioki::Model.send(:remove_const, 'ExampleReferencedClass')
        Ioki::Model.send(:remove_const, 'ExampleObjectClassName')
      end

      it 'gives access to correctly casted values and internally preserves the class' do
        model = example_class.new({})
        expect(model.foo).to be_nil
        model.foo = { bar: 42 }
        expect(model.foo).to be_a(example_referenced_class)
        expect(model.foo.bar).to eq(42)
      end
    end

    describe 'for an attribute of type :array with a class_name' do
      let(:example_referenced_class) do
        Class.new(Ioki::Model::Base) do
          attribute :bar, type: :integer, on: :read
        end
      end

      let(:example_class) do
        Class.new(Ioki::Model::Base) do
          attribute :foo, type: :array, class_name: 'ExampleReferencedClass', on: :read
        end
      end

      before do
        # Make sure that the mock class is in the correct module.
        # Equivalent to defining it in that module.
        Ioki::Model.const_set('ExampleReferencedClass', example_referenced_class)
        Ioki::Model.const_set('ExampleArrayClassName', example_class)
      end

      after do
        # To suppress "warning: already initialized constant"
        Ioki::Model.send(:remove_const, 'ExampleReferencedClass')
        Ioki::Model.send(:remove_const, 'ExampleArrayClassName')
      end

      it 'gives access to correctly casted values and internally preserves the client' do
        model = example_class.new({})
        expect(model.foo).to be_nil
        model.foo = [{ bar: '42' }, { bar: '43' }]
        expect(model.foo).to be_a(Array)
        expect(model.foo.first).to be_a(example_referenced_class)
        expect(model.foo.first.bar).to eq(42)
        expect(model.foo.last).to be_a(example_referenced_class)
        expect(model.foo.last.bar).to eq(43)
      end
    end

    describe 'for an attribute of an unknown type' do
      let(:example_class) { Class.new(Ioki::Model::Base) { attribute :foo, type: :indeger, on: :create } }

      it 'returns an error' do
        expect { example_class.new.foo = 'bar' }.to raise_error(RuntimeError, 'Unknown type indeger')
      end
    end

    describe 'default_handling' do
      describe 'for an attribute of type :string, default: 42' do
        let(:example_class) do
          Class.new(Ioki::Model::Base) { attribute :foo, type: :string, default: 42, on: :read }
        end

        it 'gives access to correctly casted default values' do
          model = example_class.new
          expect(model.foo).to eq('42')
          model.foo = 123
          expect(model.foo).to eq('123')
        end
      end
    end

    describe 'excess attributes handling' do
      describe 'for a model initialized with excess data' do
        let(:example_class) do
          Class.new(Ioki::Model::Base) { attribute :foo, type: :string, default: 'bar', on: :read }
        end

        it 'gives access to subset values' do
          model = example_class.new(foo: 21, baz: 42)
          expect(model.foo).to eq('21')
          expect(model._attributes).to eq(foo: '21')
          expect(model._raw_attributes).to eq(foo: 21, baz: 42)
        end
      end
    end
  end

  describe 'is_attribute?(attribute)' do
    let(:example_class) do
      Class.new(Ioki::Model::Base) do
        attribute :foo, on: :read
      end
    end

    it 'returns true for defined attributes' do
      expect(model).to be_is_attribute(:foo)
      expect(model).to be_is_attribute('foo')
    end

    it 'returns false for unknown attributes' do
      expect(model).not_to be_is_attribute(:bar)
      expect(model).not_to be_is_attribute('bar')
    end
  end

  describe 'set_attribute(attribute, value)' do
    let(:attributes) { {} }

    let(:example_class) do
      Class.new(Ioki::Model::Base) do
        attribute :foo, type: :string, default: 1, on: :read
      end
    end

    it 'will set known attributes' do
      model.set_attribute(:foo, 12)
      expect(model.foo).to eq('12')
      expect(model._raw_attributes).to eq({ foo: 12 })
      expect(model._attributes).to eq({ foo: '12' })
    end

    it 'will silently discard unknown values' do
      model.set_attribute(:bar, 12)
      expect(model._raw_attributes).to eq({ foo: 1 })
      expect(model._attributes).to eq({ foo: '1' })
    end
  end

  describe 'attributes(**attributes)' do
    let(:attributes) { {} }

    let(:example_class) do
      Class.new(Ioki::Model::Base) do
        attribute :foo, type: :string, default: 1, on: :read
        attribute :bar, type: :integer, default: 2, on: :read
        attribute :baz, default: 3, on: :read
      end
    end

    it 'will set the passed attributes in raw and typecasted form and return the typecasted attributes' do
      expect(model._raw_attributes).to eq({ foo: 1, bar: 2, baz: 3 })
      expect(model._attributes).to eq({ foo: '1', bar: 2, baz: 3 })

      result = model.attributes(foo: 42, bar: 43, unknown: 123)

      expect(model._raw_attributes).to eq({ foo: 42, bar: 43, baz: 3 })
      expect(model._attributes).to eq({ foo: '42', bar: 43, baz: 3 })

      expect(result).to eq(model._attributes)
    end
  end

  describe 'serialization' do
    describe 'conversion' do
      let(:example_class) do
        Class.new(Ioki::Model::Base) do
          attribute :foo, on: :read
          attribute :bar, type: :string, on: :read
          attribute :baz, type: :integer, on: :read
          attribute :bam, type: :float, on: :read
          attribute :brk, type: :boolean, on: :read
          attribute :baf, type: :date_time, on: :read
          attribute :bak, type: :object, on: :read
        end
      end

      let(:attributes) do
        {
          'foo' => '1',
          'bar' => '2',
          'baz' => '3',
          'bam' => '4',
          'brk' => '5',
          'baf' => '2020-01-01 12:34:56 +0200',
          'bak' => {
            'lol' => '42'
          }
        }
      end

      it 'properly works and converts the values in the internal attributes' do
        expect(model.serialize).to eq(
          {
            foo: '1',
            bar: '2',
            baz: 3,
            bam: 4.0,
            brk: false,
            baf: DateTime.parse('2020-01-01 12:34:56 +0200'),
            bak: {
              'lol' => '42'
            }
          }
        )
      end
    end

    describe ':on parameter' do
      let(:example_class) do
        Class.new(Ioki::Model::Base) do
          attribute :foo, on: [:read, :create]
          attribute :bar, on: :create
        end
      end

      let(:attributes) { { 'foo' => '1', 'bar' => '2' } }

      it 'omits attributes when context is omitted' do
        expect(model.serialize).to eq({ foo: '1' })
      end

      it 'includes attributes when context is matched' do
        expect(model.serialize(:create)).to eq({ foo: '1', bar: '2' })
      end

      it 'omits attributes when context is not matched' do
        expect(model.serialize(:other)).to eq({})
      end
    end

    describe ':omit_if_nil_on parameter' do
      let(:example_class) do
        Class.new(Ioki::Model::Base) do
          attribute :foo, on: [:read, :create]
          attribute :bar, on: :create, omit_if_nil_on: [:create]
        end
      end

      let(:attributes) { { 'foo' => '1', 'bar' => '2' } }

      it 'includes attributes when context is not matched' do
        expect(model.serialize(:other)).to eq({})
      end

      it 'includes attributes when context is matched and values are present' do
        expect(model.serialize(:create)).to eq({ foo: '1', bar: '2' })
      end

      it 'includes attributes when context is matched and values are blank' do
        attributes['bar'] = ''
        expect(model.serialize(:create)).to eq({ foo: '1', bar: '' })
      end

      it 'omits attributes when context is matched and values are nil' do
        attributes['bar'] = nil
        expect(model.serialize(:create)).to eq({ foo: '1' })
      end
    end

    describe ':omit_if_blank_on parameter' do
      let(:example_class) do
        Class.new(Ioki::Model::Base) do
          attribute :foo, on: [:read, :create]
          attribute :bar, on: :create, omit_if_blank_on: [:create]
        end
      end

      let(:attributes) { { 'foo' => '1', 'bar' => '2' } }

      it 'includes attributes when context is omitted' do
        expect(model.serialize).to eq({ foo: '1' })
      end

      it 'includes attributes when context is not matched' do
        expect(model.serialize(:other)).to eq({})
      end

      it 'includes attributes when context is matched and values are present' do
        expect(model.serialize(:create)).to eq({ foo: '1', bar: '2' })
      end

      it 'omits attributes when context is matched and values are blank' do
        attributes['bar'] = ''
        expect(model.serialize(:create)).to eq({ foo: '1' })
      end

      it 'omits attributes when context is matched and values are nil' do
        attributes['bar'] = nil
        expect(model.serialize(:create)).to eq({ foo: '1' })
      end
    end
  end

  describe '#type_cast_attribute_value' do
    describe 'type: :string' do
      let(:example_class) { Class.new(Ioki::Model::Base) { attribute :attr, type: :string, on: :read } }

      it 'handles nil correctly' do
        expect(model.type_cast_attribute_value(:attr, nil)).to be_nil
      end

      it 'handles a string correctly' do
        expect(model.type_cast_attribute_value(:attr, 'foobar')).to eq('foobar')
      end

      it 'handles input to get converted correctly' do
        expect(model.type_cast_attribute_value(:attr, 123.45)).to eq('123.45')
      end
    end

    describe 'type: :integer' do
      let(:example_class) { Class.new(Ioki::Model::Base) { attribute :attr, type: :integer, on: :read } }

      it 'handles nil correctly' do
        expect(model.type_cast_attribute_value(:attr, nil)).to be_nil
      end

      it 'handles a integer correctly' do
        expect(model.type_cast_attribute_value(:attr, 42)).to eq(42)
      end

      it 'handles input to get converted correctly' do
        expect(model.type_cast_attribute_value(:attr, '4711foo')).to eq(4711)
      end
    end

    describe 'type: :float' do
      let(:example_class) { Class.new(Ioki::Model::Base) { attribute :attr, type: :float, on: :read } }

      it 'handles nil correctly' do
        expect(model.type_cast_attribute_value(:attr, nil)).to be_nil
      end

      it 'handles a float correctly' do
        expect(model.type_cast_attribute_value(:attr, 12.34)).to eq(12.34)
      end

      it 'handles input to get converted correctly' do
        expect(model.type_cast_attribute_value(:attr, '12.34foo')).to eq(12.34)
      end
    end

    describe 'type: :boolean' do
      let(:example_class) { Class.new(Ioki::Model::Base) { attribute :attr, type: :boolean, on: :read } }

      it 'handles nil correctly' do
        expect(model.type_cast_attribute_value(:attr, nil)).to be_nil
      end

      it 'handles a boolean correctly' do
        expect(model.type_cast_attribute_value(:attr, true)).to be(true)
      end

      it 'handles input to get converted correctly' do
        expect(model.type_cast_attribute_value(:attr, 'foobar')).to be(false)

        expect(model.type_cast_attribute_value(:attr, 0)).to be(false)
        expect(model.type_cast_attribute_value(:attr, false)).to be(false)
        expect(model.type_cast_attribute_value(:attr, 'false')).to be(false)
        expect(model.type_cast_attribute_value(:attr, 'f')).to be(false)
        expect(model.type_cast_attribute_value(:attr, '0')).to be(false)
        expect(model.type_cast_attribute_value(:attr, '')).to be(false)

        expect(model.type_cast_attribute_value(:attr, 1)).to be(true)
        expect(model.type_cast_attribute_value(:attr, true)).to be(true)
        expect(model.type_cast_attribute_value(:attr, 'true')).to be(true)
        expect(model.type_cast_attribute_value(:attr, 't')).to be(true)
        expect(model.type_cast_attribute_value(:attr, '1')).to be(true)
      end
    end

    describe 'type: :date_time' do
      let(:example_class) { Class.new(Ioki::Model::Base) { attribute :attr, type: :date_time, on: :read } }

      it 'handles nil correctly' do
        expect(model.type_cast_attribute_value(:attr, nil)).to be_nil
      end

      it 'handles a date_time correctly' do
        expect(
          model.type_cast_attribute_value(:attr, DateTime.parse('2020-01-01 12:34:56 +0200'))
        ).to eq(
          DateTime.parse('2020-01-01 12:34:56 +0200')
        )
      end

      it 'handles input to get converted correctly' do
        expect(
          model.type_cast_attribute_value(:attr, '2020-01-01 12:34:56 +0200')
        ).to eq(
          DateTime.parse('2020-01-01 12:34:56 +0200')
        )

        expect(model.type_cast_attribute_value(:attr, '')).to be_nil
      end
    end

    describe 'type: :object' do
      let(:example_class) { Class.new(Ioki::Model::Base) { attribute :attr, type: :object, on: :read } }

      it 'handles nil correctly' do
        expect(model.type_cast_attribute_value(:attr, nil)).to be_nil
      end

      it 'handles an object correctly' do
        expect(
          model.type_cast_attribute_value(:attr, { foo: :bar })
        ).to eq(
          { foo: :bar }
        )
      end

      describe 'with class_name' do
        let(:example_class) do
          Class.new(Ioki::Model::Base) do
            attribute :attr, type: :object, class_name: 'User', on: :read
          end
        end

        before do
          # Make sure that the mock class is in the correct module.
          # Equivalent to defining it in that module.
          Ioki::Model::Platform.const_set('ExampleObjectUserClassName', example_class)
        end

        after do
          # To suppress "warning: already initialized constant"
          Ioki::Model::Platform.send(:remove_const, 'ExampleObjectUserClassName')
        end

        it 'handles nil correctly' do
          expect(model.type_cast_attribute_value(:attr, nil)).to be_nil
        end

        it 'handles an object correctly' do
          result = model.type_cast_attribute_value(:attr, { email: 'mail1@example.com' })
          expect(result).to be_a(Ioki::Model::Platform::User)
          expect(result.email).to eq('mail1@example.com')
        end
      end

      describe 'with multiple class_names' do
        let(:example_class) do
          Class.new(Ioki::Model::Base) do
            attribute :attr, type: :object, class_name: %w[Station Place], on: :read
          end
        end

        before do
          Ioki::Model::Operator.const_set('ExampleObjectClassName', example_class)
        end

        after do
          # To suppress "warning: already initialized constant"
          Ioki::Model::Operator.send(:remove_const, 'ExampleObjectClassName')
        end

        it 'handles nil correctly' do
          expect(model.type_cast_attribute_value(:attr, nil)).to be_nil
        end

        it 'returns a hash when value type is not in class_name array' do
          result = model.type_cast_attribute_value(:attr, { 'type' => 'user' })
          expect(result).not_to be_a(Ioki::Model::Operator::User)
          expect(result).to be_a(Hash)
          expect(result).to eq({ 'type' => 'user' })
        end

        it 'returns a station model when value type is station' do
          result = model.type_cast_attribute_value(:attr, { 'type' => 'station' })
          expect(result).to be_a(Ioki::Model::Operator::Station)
          expect(result.type).to eq('station')
        end

        it 'returns a place model when value type is place' do
          result = model.type_cast_attribute_value(:attr, { 'type' => 'place' })
          expect(result).to be_a(Ioki::Model::Operator::Place)
          expect(result.type).to eq('place')
        end
      end
    end

    describe 'type: :array' do
      let(:example_class) { Class.new(Ioki::Model::Base) { attribute :attr, type: :array, on: :read } }

      it 'handles nil correctly' do
        expect(model.type_cast_attribute_value(:attr, nil)).to be_nil
      end

      it 'handles an array correctly' do
        expect(
          model.type_cast_attribute_value(:attr, [1, :bar, 'baz'])
        ).to eq(
          [1, :bar, 'baz']
        )
      end

      context 'with class_name' do
        let(:example_class) do
          Class.new(Ioki::Model::Base) do
            attribute :attr, type: :array, class_name: 'User', on: :read
          end
        end

        before do
          # Make sure that the mock class is in the correct module.
          # Equivalent to defining it in that module.
          Ioki::Model::Platform.const_set('ExampleUserArrayClassName', example_class)
        end

        after do
          # To suppress "warning: already initialized constant"
          Ioki::Model::Platform.send(:remove_const, 'ExampleUserArrayClassName')
        end

        it 'handles nil correctly' do
          expect(model.type_cast_attribute_value(:attr, nil)).to be_nil
        end

        it 'handles an array of hashes correctly' do
          result = model.type_cast_attribute_value(:attr,
                                                   [{ email: 'mail1@example.com' }, { email: 'mail2@example.com' }])
          expect(result).to be_a(Array)
          expect(result.size).to eq(2)
          expect(result.first).to be_a(Ioki::Model::Platform::User)
          expect(result.first.email).to eq('mail1@example.com')
          expect(result.last).to be_a(Ioki::Model::Platform::User)
          expect(result.last.email).to eq('mail2@example.com')
        end

        it 'handles an array of fitting objects correctly' do
          result = model.type_cast_attribute_value(
            :attr,
            [
              Ioki::Model::Platform::User.new(email: 'mail1@example.com'),
              Ioki::Model::Platform::User.new(email: 'mail2@example.com')
            ]
          )

          expect(result).to be_a(Array)
          expect(result.size).to eq(2)
          expect(result.first).to be_a(Ioki::Model::Platform::User)
          expect(result.first.email).to eq('mail1@example.com')
          expect(result.last).to be_a(Ioki::Model::Platform::User)
          expect(result.last.email).to eq('mail2@example.com')
        end
      end
    end
  end

  describe '#constantize_in_module' do
    it 'returns a module of the given name in the same parent module' do
      expect(Ioki::Model::Platform::Pause.new.send(:constantize_in_module, 'Place')).to eq Ioki::Model::Platform::Place
    end
  end
end
