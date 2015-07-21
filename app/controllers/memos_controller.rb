class MemosController < ApplicationController

  def create

    memo = Memo.new params.permit(:subject_id, :content)
    memo.save
    render json: params
  end

  def update

    memo = Memo.find params[:id]
    memo.content = params[:content]
    memo.save
    render json: params
  end

  def destroy

    memo = Memo.find params[:id]
    memo.destroy
    render json: params
  end
end
