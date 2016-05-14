class User < ActiveRecord::Base
  def level
	xp / 10
  end
end
