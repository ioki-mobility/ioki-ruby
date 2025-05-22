# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class UploadRequest < Base
        attribute :id,
                  on:   :read,
                  type: :string

        attribute :byte_size,
                  on:   :create,
                  type: :integer

        attribute :checksum,
                  on:   :create,
                  type: :string

        attribute :content_type,
                  on:   :create,
                  type: :string

        attribute :direct_upload_url,
                  on:   :read,
                  type: :string

        attribute :filename,
                  on:   :create,
                  type: :string

        attribute :signed_blob_id,
                  on:   :read,
                  type: :string
      end
    end
  end
end
