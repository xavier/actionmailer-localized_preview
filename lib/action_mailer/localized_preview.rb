require "action_mailer/localized_preview/version"

module ActionMailer
  module LocalizedPreview

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def locales
        I18n.available_locales
      end

      def emails
        public_instance_methods(false).each_with_object([]) do |method, list|
          locales.each do |locale|
            list << "#{method}_#{locale}"
          end
        end.sort
      end

    end

    def method_missing(localized_method_name, *args)
      localized_method_name.to_s =~ /(.*)_([^_]+)$/
      method_name, locale = $1, $2.to_sym
      current_locale = I18n.locale
      begin
        I18n.locale = $2
        case self.method(method_name).arity
        when 0
          public_send(method_name)
        when 1
          public_send(method_name, locale)
        else
          raise ArgumentError, "wrong number of arguments (expected 0 or 1)"
        end
      ensure
        I18n.locale = current_locale
      end
    end

  end
end
