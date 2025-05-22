# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class UploadSubmission < Base
        attribute :signed_blob_id,
                  on:   :create,
                  type: :string
      end
    end
  end
end
