# frozen_string_literal: true

require 'ioki/mailing/mailer'
require 'ioki/mailing/message'

module Ioki
  class Railtie < ::Rails::Railtie
    ActiveSupport.on_load(:action_mailer) do
      add_delivery_method :ioki, Ioki::Mailing::Mailer
    end
  end
end
