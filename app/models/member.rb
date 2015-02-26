class Member < ActiveRecord::Base
  has_one :room

  def owe
    puts Purchase.rebate(id, Time.now.month)
    rent - Purchase.rebate(id, Time.now.month)
  end

  def name
    "#{(fname || "")} #{(lname || "")}".strip
  end

  def rent
    r = Room.find_by_resident(id)
    if r.blank?
      0.00
    else
       r.rent
    end
  end

  def room_number
    r = Room.find_by_resident(id)
    if r.blank?
      ""
    else
      r.room_number
    end
  end

end
