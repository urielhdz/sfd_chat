class ChatMessagesController < ApplicationController
  before_action :set_chat_message, only: [:show, :edit, :update, :destroy]
  
  # GET /chat_messages
  # GET /chat_messages.json
  def index
    @chat_messages = ChatMessage.order("created_at DESC").all
    respond_to do |format|
      format.json {render json: @chat_messages}
    end
  end

  # GET /chat_messages/1
  # GET /chat_messages/1.json
  def show
  end
  # POST /chat_messages
  # POST /chat_messages.json
  def create
    @chat_message = ChatMessage.new(chat_message_params)

    respond_to do |format|
      if @chat_message.save
        format.html { redirect_to @chat_message, notice: 'Chat message was successfully created.' }
        format.json { render :show, status: :created, location: @chat_message }
      else
        format.html { render :new }
        format.json { render json: @chat_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_messages/1
  # DELETE /chat_messages/1.json
  def destroy
    @chat_message.destroy
    respond_to do |format|
      format.html { redirect_to chat_messages_url, notice: 'Chat message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_message
      @chat_message = ChatMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_message_params
      params.require(:chat_message).permit(:message)
    end
end
