module AttrRequired

  class AttrMissing < StandardError; end

  def self.included(klass)
    klass.send :extend, ClassMethods
  end

  module ClassMethods

    def inherited(klass)
      super
      unless required_attributes.empty?
        klass.attr_required *required_attributes
      end
    end

    def attr_required(*keys)
      @required_attributes ||= []
      @required_attributes += Array(keys)
      attr_accessor *keys
    end

    def attr_required?(key)
      required_attributes.include?(key)
    end

    def required_attributes
      Array(@required_attributes)
    end

  end

  def required_attributes
    self.class.required_attributes
  end

  def attr_required?(key)
    self.class.attr_required? key
  end

  def attr_missing?
    !attr_missing.empty?
  end

  def attr_missing!
    if attr_missing?
      raise AttrMissing.new("'#{attr_missing.join('\', \'')}' required.")
    end
  end

  def attr_missing
    required_attributes.select do |key|
      value = send(key)
      if value.respond_to?(:empty?)
        value.empty?
      else
        value.nil?
      end
    end
  end

end