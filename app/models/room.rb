class Room < ActiveRecord::Base
  belongs_to :member

  def self.find_by_resident id
    Room.find_by member_id: id
  end

  def self.empty
    Room.where(member_id: nil)
  end

  def self.update(room_num, member)
  end

  def self.available
    @rms = "<option value=''></option>"

    self.empty do |rm|
      @rms += "<option value='#{rm.room_number}'>#{rm.room_number}</option>"
    end  
    @rms
  end

  def resident
    m = Member.find(member_id) if member_id != nil
    m
  end

end
