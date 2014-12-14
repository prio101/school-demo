module Api
module V1
  class StudentsController < ApiController

    def account

    end

    # 4510676ffe98d7ce7f574d2e6c58d4af

    def balance
      throw_access_denied unless params[:id]
      @student = Student.find_by(id: params[:id])
      throw_access_denied unless @student
      render :json => {balance: @student.amount_payable}, status: 200 if @student
    end

    def add_balance

      #transid  - Payment transaction number from Selcom
      #channel – The Payment channel used (M-pesa, Tigo Pesa, POS, etc)
      #account – The student ID
      #amount – The amount being paid
      #msisdn – The payer’s phone number, if available

      throw_access_denied unless params[:id]
      throw_access_denied unless params[:amount]
      @student = Student.find_by(id: params[:id])
      throw_access_denied unless @student
      @balances = @student.student_balances.new({
                                                  school_id: @student.school_id,
                                                  student_id: @student.id,
                                                  amount: params[:amount],
                                                  msisdn: params[:msisdn],
                                                  due: false,
                                                  channel: params[:channel],
                                                  transaction_id: params[:transid].to_s,
                                                  reference: "#{params[:msisdn]} - #{params[:channel]}"
                                              })

      render json: @balances.save, status: 200

      #curl -X POST  "http://test.skoolwings.com/api/balance?account=1-1&amount=20000&msisdn=0178123421&channel=pos&transid=124567&token=4510676ffe98d7ce7f574d2e6c58d4af" --header "Content-Type:application/json"
       #curl -X GET  "http://test.skoolwings.com/api/balance?id=1-1&token=4510676ffe98d7ce7f574d2e6c58d4af" --header "Content-Type:application/json"
    end
  end
  end
end
