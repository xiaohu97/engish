# Monkeypatch for Ruby 3.2+ compatibility with older Liquid templates
# Liquid 4.0.3 uses Object#tainted? which was removed in Ruby 3.2.

puts ">>> LOADING TAINTED MONKEYPATCH PLUGIN <<<"
STDOUT.sync = true
STDERR.sync = true

unless Object.method_defined?(:tainted?)
  class Object
    def tainted?
      false
    end
  end
end

unless Object.method_defined?(:taint)
  class Object
    def taint
      self
    end
  end
end

unless Object.method_defined?(:untaint)
  class Object
    def untaint
      self
    end
  end
end
