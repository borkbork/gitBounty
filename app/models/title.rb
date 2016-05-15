class Title < ActiveRecord::Base
  def next_title
    Title.where("lv_req > #{lv_req}").order(lv_req: :desc).first
  end
end
