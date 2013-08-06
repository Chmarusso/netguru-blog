class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String
  field :abusive, type: Boolean, default: nil

  belongs_to :user
  belongs_to :post
  has_many :votes 

  def toggle_abusive
  	if self.abusive 
  		update_attribute :abusive, false 
  	else
  		update_attribute :abusive, true
  	end
  end

  def total_votes
    self.votes.sum(:value) 
  end

  def negative_votes
    self.votes.where(:value => -1).count
  end

end
