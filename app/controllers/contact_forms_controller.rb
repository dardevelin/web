class ContactFormsController < ApplicationController

  def new
    @contact_form = ContactForm.new
    respond_to do |format|
      format.js
      format.html
    end
    expires_in 3.hours, 'max-stale' => 5.hours, :public => true
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
