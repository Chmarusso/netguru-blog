class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String
  field :abusive, type: Boolean, default: false

  belongs_to :user
  belongs_to :post

  def toggle_abusive
  	if self.abusive 
  		update_attribute :abusive, false 
  	else
  		update_attribute :abusive, true
  	end
  end

end
