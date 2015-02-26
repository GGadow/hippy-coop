class Purchase < ActiveRecord::Base

  def self.purchases_by_range(member_id, start_date: nil, end_date: nil)
    if start_date.nil? && end_date.nil? 
      #Find all purchases made by the member
      @purchases_by = Purchase.where("member_id=?", member_id).all

    elsif start_date.nil? 
      #Find all purchases made by the member up to and including the provided end date
      @purchases_by = Purchase.where("member_id=? AND purchase_date<=?",  member_id, end_date).all

    elsif end_date.nil?
      #Find all purchases made by the member including and since the provided start date
      @purchases_by = Purchase.where("member_id=? AND purchase_date>=?",  member_id, start_date).all

    else
      #Find all purchases made by the member between and including the provided dates
      @purchases_by = Purchase.where("member_id=? AND purchase_date BETWEEN ? AND ?",  member_id, start_date, end_date).all
    end

    @purchases_by
  end

  def self.purchases_by(member_id, month)
    start_date = "#{Time.now.year}-#{month.to_s.rjust(2, "0")}-01 00:00"
    end_date = "#{Time.now.year}-#{month.to_s.rjust(2, "0")}-#{Time.days_in_month(month, Time.now.year)} 23:59"
    self.purchases_by_range(member_id, start_date: start_date, end_date: end_date)
  end

  def self.rebate(member_id, month)
puts "Rebate for #{member_id} in #{month}"
    @amt = 0.0
    purch = self.purchases_by(member_id, month).each do |p|
      @amt += p.amount
    end

    @amt
  end

end
