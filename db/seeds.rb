# Clear all old data

Purchase.delete_all
Room.delete_all
Member.delete_all

#Add Member data

@member = Member.create(fname: "Alvin", lname: "Aardvark")
Member.create(fname: "Betty", lname: "Burrows")
Member.create(fname: "Carlos", lname: "Costas")
Member.create(fname: "Darla", lname: "Dean")
Member.create(fname: "Ed", lname: "Evinston")

#Add Room data

Room.create(room_number: "A", rent: 480, member_id: @member.id)
Room.create(room_number: "B", rent: 560)
Room.create(room_number: "C", rent: 490)
Room.create(room_number: "D", rent: 540)
