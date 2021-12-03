module CommonHelpers
    module Controllers
      def request_header
        { 'Content-Type' => 'application/json' }
      end
  
      def response_data
        JSON.parse(last_response.body)['data']
      end
  
      def response_errors
        JSON.parse(last_response.body)['errors']
      end
  
      def response_meta
        JSON.parse(last_response.body)['meta']
      end
  
      def response_message
        JSON.parse(last_response.body)['message']
      end
  
      def error_response(error_message, code)
        [
          {
            'message' => error_message,
            'code' => code
          }
        ]
      end
  
      def meta_response(http_status, pagination = nil)
        return { 'http_status' => http_status } unless pagination.present?
  
        {
          'http_status' => http_status,
          'offset' => pagination[:offset],
          'limit' => pagination[:limit],
          'total' => pagination[:total]
        }
      end
    end
  end
  
  RSpec.configure do |config|
    config.include CommonHelpers::Controllers, type: :controller
  end
  