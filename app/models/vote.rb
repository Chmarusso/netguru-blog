class Vote
  include Mongoid::Document
  include Mongoid::Timestamps

  after_create :mark_as_abusive

  belongs_to :user
  belongs_to :comment

  field :value, type: Integer

	def self.thumb_up(user, comment_id)
		begin
			Vote.create!(:user => user, :comment_id => comment_id, :value => 1) unless voted?(user, comment_id)
		rescue
			false
		end
	end

	def self.thumb_down(user, comment_id)
		begin
			Vote.create!(:user => user, :comment_id => comment_id, :value => -1) unless voted?(user, comment_id)
		rescue
			false
		end
	end

	def self.voted?(user, comment)
		#Vote.where(:user => user, :comment_id => comment).exists?
		false
	end

	private

	def mark_as_abusive
		self.comment.toggle_abusive if self.comment.abusive.nil? && self.comment.negative_votes >= 3
	end

end
