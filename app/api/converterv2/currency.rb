
require 'grape-swagger'
module Converterv2
  class Currency < Grape::API
    version 'v2', using: :path
    format :json
    rescue_from :all

    # error_formatter :json, lambda { |message, backtrace, options, env|
    #   {
    #     status: 'failed',
    #     message: message,
    #     error_code: 123
    #   }.to_json
    # }

    helpers do
      def get_exchange_rate(currency)
        case currency
        when 'NTD'
          30
        else
          raise StandardError.new "no conversion found for currency #{currency}"
        end
      end
    end

    resource :converter do

      desc 'convert currency',
      headers: {
        'Authorization' => {
          description: 'Validates your authorization.',
          required: true,
        },
      },
        success: { code: 201, model:
      Entities::ConverterEntity, message: 'Created' },
        failure: [
        { code: 404, model:
          Entities::NotFoundEntity, message: 'Not Found' },
      ]

      params do
        requires :amount, type: Float
        requires :to_currency, type: String
      end

      get :exchange do
        converted_amount = params[:amount] * get_exchange_rate(params[:to_currency])
        {
          amount: converted_amount,
          currency: params[:to_currency]
        }
      end
    end

    add_swagger_documentation mount_path: '/swagger_doc',
                              schemes: ['https'],
                              host: 'localhost:3050',
                              doc_version: '1.0.2',
                              info: {
                                title: 'Converter Api',
                                license: 'Proprietary',
                                description: '
**Converter is used to convert currency**
                                ',
                              }

  end
end


