require 'NilBeGone/version'
require 'binding_of_caller'

class NilClass
  def method_missing(method, *args, &block)
    missing_value = nil
    n = 2
    loop do
      begin
        missing_value = binding.of_caller(n).eval('nil_value rescue nil')
        return missing_value.send(method, *args, &block) unless missing_value.nil?
        n += 1
      rescue
        break
      end
    end
    super
  end
end
