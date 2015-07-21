class MemosController < ApplicationController

  def create

    memo = Memo.new params.permit(:subject_id, :content)
    memo.save

    render json: params
  end
end
