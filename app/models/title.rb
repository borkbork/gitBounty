class Title < ActiveRecord::Base
  validates :lang, :presence => true
  validates :lv_req, :presence => true, :uniqueness => {:scope => :lang}

  def next_title
    Title.where("lv_req > #{lv_req}").order(lv_req: :desc).first
  end
end
