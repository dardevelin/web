class ContactFormsController < ApplicationController

  def new
    @contact_form = ContactForm.new
    @contact_form.service = params[:service] if params[:service]
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request
    if @contact_form.deliver
      flash[:notice] = 'Thank you for contacting us! You will be receiving an answer soon'
    end
    render :action => 'new'
  end

end
