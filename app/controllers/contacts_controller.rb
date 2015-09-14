class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Wiadomość została wysłana.'
    else
      flash.now[:error] = 'Przy wysyłaniu wiadomości wystąpił problem.'
      render :new
    end
  end
end
