# Reset data
Invoice.destroy_all
ServiceUsage.destroy_all
Service.destroy_all
Reservation.destroy_all
Guest.destroy_all
Room.destroy_all

# ------------------------
# ROOMS
# ------------------------
rooms = Room.create!([
  { number: "101", room_type: 0, price: 50_000, status: 0 }, # single
  { number: "102", room_type: 1, price: 75_000, status: 0 }, # double
  { number: "201", room_type: 2, price: 120_000, status: 1 }, # suite
  { number: "202", room_type: 1, price: 80_000, status: 0 }, # double
  { number: "301", room_type: 2, price: 150_000, status: 0 }, # suite
  { number: "303", room_type: 0, price: 55_000, status: 1 }  # single
])

# ------------------------
# GUESTS
# ------------------------
guests = Guest.create!([
  { first_name: "Anna", last_name: "Perez", email: "anna@example.com", phone: "+56911111111", document_id: "12345678-9" },
  { first_name: "Charles", last_name: "Soto", email: "charles@example.com", phone: "+56922222222", document_id: "98765432-1" },
  { first_name: "Emily", last_name: "Johnson", email: "emily@example.com", phone: "+56933333333", document_id: "11223344-5" },
  { first_name: "Michael", last_name: "Brown", email: "michael@example.com", phone: "+56944444444", document_id: "55667788-9" }
])

# ------------------------
# RESERVATIONS
# ------------------------
reservations = [
  Reservation.create!(
    code: "RES-001",
    guest: guests[0],
    room: rooms[0],
    check_in: Date.today,
    check_out: Date.today + 2,
    status: 0,
    adults: 1,
    children: 0
  ),
  Reservation.create!(
    code: "RES-002",
    guest: guests[1],
    room: rooms[1],
    check_in: Date.today + 1,
    check_out: Date.today + 4,
    status: 1,
    adults: 2,
    children: 1
  ),
  Reservation.create!(
    code: "RES-003",
    guest: guests[2],
    room: rooms[3],
    check_in: Date.today + 2,
    check_out: Date.today + 5,
    status: 0,
    adults: 2,
    children: 0
  ),
  Reservation.create!(
    code: "RES-004",
    guest: guests[3],
    room: rooms[4],
    check_in: Date.today + 3,
    check_out: Date.today + 6,
    status: 0,
    adults: 1,
    children: 1
  )
]

# ------------------------
# SERVICES
# ------------------------
services = Service.create!([
  { name: "Minibar", price: 8_000, is_active: true },
  { name: "Massage", price: 25_000, is_active: true },
  { name: "Laundry", price: 5_000, is_active: true },
  { name: "Room Cleaning", price: 10_000, is_active: true },
  { name: "Breakfast Buffet", price: 15_000, is_active: true }
])

# ------------------------
# SERVICE USAGE
# ------------------------
ServiceUsage.create!([
  { reservation: reservations[0], service: services[0], quantity: 2, used_at: DateTime.now, note: "2 drinks from minibar" },
  { reservation: reservations[0], service: services[2], quantity: 1, used_at: DateTime.now, note: "Express laundry" },
  { reservation: reservations[1], service: services[1], quantity: 1, used_at: DateTime.now, note: "Relaxing massage" },
  { reservation: reservations[2], service: services[3], quantity: 1, used_at: DateTime.now, note: "Room cleaning service" },
  { reservation: reservations[3], service: services[4], quantity: 2, used_at: DateTime.now, note: "Buffet breakfast for 2" }
])

# ------------------------
# INVOICES
# ------------------------
Invoice.create!([
  {
    reservation: reservations[0],
    nights_subtotal: 2 * rooms[0].price,
    services_subtotal: 21_000,
    tax: 0.19 * (2 * rooms[0].price + 21_000),
    total: (2 * rooms[0].price + 21_000) * 1.19,
    issued_at: DateTime.now,
    status: "issued"
  },
  {
    reservation: reservations[1],
    nights_subtotal: 3 * rooms[1].price,
    services_subtotal: 25_000,
    tax: 0.19 * (3 * rooms[1].price + 25_000),
    total: (3 * rooms[1].price + 25_000) * 1.19,
    issued_at: DateTime.now,
    status: "draft"
  },
  {
    reservation: reservations[2],
    nights_subtotal: 3 * rooms[3].price,
    services_subtotal: 10_000,
    tax: 0.19 * (3 * rooms[3].price + 10_000),
    total: (3 * rooms[3].price + 10_000) * 1.19,
    issued_at: DateTime.now,
    status: "issued"
  },
  {
    reservation: reservations[3],
    nights_subtotal: 3 * rooms[4].price,
    services_subtotal: 30_000,
    tax: 0.19 * (3 * rooms[4].price + 30_000),
    total: (3 * rooms[4].price + 30_000) * 1.19,
    issued_at: DateTime.now,
    status: "draft"
  }
])
