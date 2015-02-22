class Room < ActiveRecord::Base

  def self.find_by_resident id
    Room.find_by member_id: id
  end

  def resident
    m = Member.find(member_id) if member_id != nil
    m
  end

end
