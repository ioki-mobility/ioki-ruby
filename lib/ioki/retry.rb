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
      rescue StandardError => e
        retries -= 1

        raise MaximumReached, "Gave up after #{max_retries} retries: #{e.message}" if retries <= 0

        sleep(sleep_seconds)
        retry
      end
    end
  end
end
