class MessagesController < ApplicationController
  def new
    @jamm = Jamm.find(params[:jamm_id])
    @message = Message.new
    authorize @jamm
  end

  def create
    @jamm = Jamm.find(params[:jamm_id])
    authorize @jamm
    @message = Message.new(message_params)
    @message.user = current_user
    @message.jamm = @jamm
    if @message.save
      redirect_to jamm_path(@jamm)
    else
      render 'new'
    end
  end

  def destroy
    @jamm = Jamm.find(params[:jamm_id])
    @message = Message.find(params[:id])
    @message.destroy
    authorize @message
    redirect_to jamm_path(@jamm)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
