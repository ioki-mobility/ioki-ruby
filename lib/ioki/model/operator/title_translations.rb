# frozen_string_literal: true

module Ioki
  module Model
    module Operator
      class TitleTranslations < Base
        attribute :title_en,
                  on:   [:create, :update],
                  type: :string

        attribute :title_de,
        on:   [:create, :update],
                  type: :string

        attribute :title_fr,
        on:   [:create, :update],
                  type: :string

        attribute :title_de_ch,
                  on:   [:create, :update],
                  type: :string

        attribute :title_nl,
                  on:   [:create, :update],
                  type: :string

        attribute :title_es,
                  on:   [:create, :update],
                  type: :string

        attribute :title_it,
                  on:   [:create, :update],
                  type: :string

        attribute :title_ca,
                  on:   [:create, :update],
                  type: :string

        attribute :title_en_jm,
                  on:   [:create, :update],
                  type: :string

        attribute :title_ar,
                  on:   [:create, :update],
                  type: :string

        attribute :title_da,
                  on:   [:create, :update],
                  type: :string

        attribute :title_tr,
                  on:   [:create, :update],
                  type: :string

        attribute :title_uk,
                  on:   [:create, :update],
                  type: :string

        attribute :title_en_bz,
                  on:   [:create, :update],
                  type: :string
      end
    end
  end
end
