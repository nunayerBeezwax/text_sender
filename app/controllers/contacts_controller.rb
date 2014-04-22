class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contacts_params)
		if @contact.save
			flash[:notice] = "Contact Saved!"
			redirect_to contacts_path(@contact)
		else
			render 'new'
		end
	end

	def show
		@contact = Contact.find(params[:id])
	end

private
	def contacts_params
		params.require(:contact).permit(:name, :phone, :user_id)
	end
end