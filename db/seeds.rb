# Clear all old data

Purchase.delete_all
Room.delete_all
Member.delete_all

#Add Member data

@memberA = Member.create(fname: "Alvin", lname: "Aardvark")
@memberB = Member.create(fname: "Betty", lname: "Burrows")
@memberC = Member.create(fname: "Carlos", lname: "Costas")
Member.create(fname: "Darla", lname: "Dean")
Member.create(fname: "Ed", lname: "Evinston")

#Add Room data

Room.create(room_number: "A", rent: 480, member_id: @memberA.id)
Room.create(room_number: "B", rent: 560, member_id: @memberB.id)
Room.create(room_number: "C", rent: 490, member_id: @memberC.id)
Room.create(room_number: "D", rent: 540)
Room.create(room_number: "E", rent: 540)
Room.create(room_number: "F", rent: 540)

#Add some purchases

Purchase.create(member_id: @memberA.id, purchase_date: "2015-01-25", description: "Electric bill", amount: 58.12)
Purchase.create(member_id: @memberB.id, purchase_date: "2015-01-29", description: "Telephone", amount: 112.37)

Purchase.create(member_id: @memberA.id, purchase_date: "2015-02-15", description: "Toilet paper", amount: 11.98)
Purchase.create(member_id: @memberA.id, purchase_date: "2015-02-15", description: "Butter", amount: 4.25)
Purchase.create(member_id: @memberA.id, purchase_date: "2015-02-17", description: "Veggies", amount: 9.14)

Purchase.create(member_id: @memberB.id, purchase_date: "2015-02-23", description: "Coffee", amount: 7.22)

