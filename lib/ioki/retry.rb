# frozen_string_literal: true

module Ioki
  module Retry
    class MaximumReached < ::StandardError; end

    def self.n_times(max_retries, sleep_seconds = 1)
      retries = max_retries

      begin
        yield
      rescue Ioki::Error::OauthRefreshToken => e
        raise e
      rescue Ioki::Error::Base => e
        retries -= 1

        raise MaximumReached, "Gave up after #{max_retries} retries: #{e.message}" if retries <= 0

        http_status = e.http_response&.status&.to_s
        raise e if http_status && http_status.chars.first != '5'

        sleep(sleep_seconds)
        retry
      end
    end
  end
end
