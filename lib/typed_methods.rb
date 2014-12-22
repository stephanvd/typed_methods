module TypedMethods
  def tdef name, def_args, &block
    return_type = def_args.delete :return

    define_method(name) do |*args|
      @@tdef_args = {}
      def_args.zip(args).each do |(key, type), value|
        if !(value.class == type || value.class.kind_of?(type))
          raise ArgumentTypeError, "#{type.to_s} expected, #{value.class.to_s} found."
        end

        @@tdef_args[key] = value
      end

      result = ->{yield}.()

      if !(result.class == return_type || result.class.kind_of?(return_type))
        raise ReturnTypeError, "#{return_type.to_s} expected, #{result.class.to_s} found."
      end

      result
    end
  end

  def method_missing(m, *args, &block)
    @@tdef_args[m]
  end

  class ArgumentTypeError < StandardError; end
  class ReturnTypeError < StandardError; end
end
