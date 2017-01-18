require 'multi_json'

module Sellsy
  class Payment
    attr_accessor :id, :docid, :amount

    def create
      command = {
          'method' => 'Document.createPayment',
          'params' => {
              'payment' => {
                  'amount' => @amount,
                  'medium' => 1980974,
                  'date' => Time.now.to_i,
                  'doctype' => 'invoice',
                  'docid' => @docid
              }
          }
      }

      Sellsy::Api.request command
    end
  end
end
