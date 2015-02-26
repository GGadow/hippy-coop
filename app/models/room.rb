class Room < ActiveRecord::Base
  belongs_to :member

  def self.find_by_resident id
    Room.find_by member_id: id
  end

  def self.empty
    Room.where(member_id: nil)
  end

  def self.update(room_num, member)
    r = Room.find_by room_number: room_num
    r.member_id = member
    r.save
  end

  def self.options_all
    @rms = Array.new

    src = Array.new
    src << ""
    src << ""
    @rms << src

   Room.all.each do |rm|
      src = Array.new
      src = rm.room_number
      src = rm.room_number
      @rms << src
    end

    @sorted = @rms.sort_by do |i|
      i.first
    end

    @sorted
  end

  def self.options_available
    @rms = Array.new

    src = Array.new
    src << ""
    src << ""
    @rms << src
  
    self.empty.each do |rm|
      src = Array.new
      src << rm.room_number
      src << rm.room_number
      @rms << src
    end

    @sorted = @rms.sort_by do |i|
      i.first
    end

    @sorted
  end

  def resident
    m = Member.find(member_id) if member_id != nil
    m
  end

end
