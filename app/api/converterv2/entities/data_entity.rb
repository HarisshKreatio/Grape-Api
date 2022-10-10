module Converterv2
  module Entities
    class DataEntity < Grape::Entity
      expose :_amount, documentation:
        {
          desc: '_amount',
          default: 'articles_dup_20190704065957539',
        }
      expose :_to_currency, documentation:
        {
          desc: '_to_currency',
          default: 'article',
        }
      end
  end
  end