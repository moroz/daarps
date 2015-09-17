class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver_now
      flash[:success] = 'Wiadomość została wysłana.'
      render :new
    else
      flash[:danger] = 'Przy wysyłaniu wiadomości wystąpił problem.'
      render :new
    end
  end
end
