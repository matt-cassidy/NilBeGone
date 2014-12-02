unless Object.const_defined? :NilBeGone
  $:.unshift File.expand_path '../../lib', __FILE__
  require 'NilBeGone'
  require 'NilBeGone/version'
end

describe NilBeGone do
  describe 'magic' do
    it 'should look up nil_value in binding for LHS' do
      nil_value = 2
      (nil + 2).should eql(4)
    end


    xit 'should look up nil_value in binding for RHS' do
      nil_value = 3
      result = 2 + nil
      result.should eql(5)
    end

    it 'should pass along the message to the nil_value' do
      nil_value = 'hello'
      (nil.split('')).should eql(%w(h e l l o))
    end

    it 'should work if variable isnt the nil literal on the LHS' do
      nil_value = 'hello'
      other_value = nil
      (other_value + ' world').should eql('hello world')
    end

    xit 'should work if variable isnt the nil literal on the RHS' do
      nil_value = ' world'
      other_value = nil
      ('hello' + other_value).should eql('hello world')
    end

    it 'should look up multiple bindings for nil_value' do
      klass = Class.new do
        def a
          nil_value = 'hello'
          b
        end

        def b
          c
        end

        def c
          nil + ' world'
        end
      end
      klass.new.a.should eql('hello world')
    end
  end
end