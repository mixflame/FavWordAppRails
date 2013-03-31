class Word < ActiveRecord::Base
  attr_accessible :down_votes, :up_votes, :word

  validates_uniqueness_of :word

end
