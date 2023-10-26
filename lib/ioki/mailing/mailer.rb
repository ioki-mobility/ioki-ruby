# frozen_string_literal: true

module Ioki
  module Mailing
    class Mailer
      def initialize(config = nil)
        @config = config
      end

      def deliver!(mail)
        unless valid_options?(mail.ioki_options)
          raise ArgumentError, <<~ERROR
            You need to supply valid `ioki_options` when calling `mail`.

            For example:

            mail(subject: 'Test E-Mail').tap do |message|
              message.ioki_options = {
                provider: my_provider,
                platform_client: Ioki::Client.new(Ioki::Configuration.new(my_ioki_config), Ioki::PlatformApi)
              }
            end
          ERROR
        end

        delivery_context = mail.ioki_options[:delivery_context] || 'standard'
        platform_client = mail.ioki_options[:platform_client]
        provider = Ioki::Model::Platform::Provider.new(id: mail.ioki_options[:provider_id])

        email_delivery = Ioki::Model::Platform::EmailDelivery.new(
          delivery_context: delivery_context,
          mime_message:     mail.encoded,
          user_id:          mail.ioki_options[:user_id]
        )

        platform_client.create_email_delivery(provider, email_delivery)
      end

      private

      def valid_options?(options)
        return false unless options

        !!(options[:platform_client] && options[:provider_id])
      end
    end
  end
end
