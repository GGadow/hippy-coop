class Member < ActiveRecord::Base

  def name
    "#{(fname || "")} #{(lname || "")}".strip
  end

  def rent
    r = Room.find_by_resident(id)
    if r.blank?
      0.00
    else
      #TODO: replace with calculation for purchases
       r.rent
    end
  end

#  def room_number
#    r = Room.find_by_resident(id)
#    if r.empty?
#      ""
#    else
#      r.room_number
#    end
#  end

end
