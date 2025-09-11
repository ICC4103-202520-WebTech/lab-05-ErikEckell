# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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
  { number: "101", room_type: 0, price: 50000, status: 0 }, # single
  { number: "102", room_type: 1, price: 75000, status: 0 }, # double
  { number: "201", room_type: 2, price: 120000, status: 1 }, # suite
  { number: "202", room_type: 1, price: 80000, status: 0 }, # double
  { number: "301", room_type: 2, price: 150000, status: 0 }, # suite
  { number: "303", room_type: 0, price: 55000, status: 1 }  # single
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
reservations = Reservation.create!([
  { code: "RES-001", guest_id: guests[0].id, room_id: rooms[0].id, check_in: Date.today, check_out: Date.today + 2, status: 0, adults: 1, children: 0 },
  { code: "RES-002", guest_id: guests[1].id, room_id: rooms[1].id, check_in: Date.today + 1, check_out: Date.today + 4, status: 1, adults: 2, children: 1 },
  { code: "RES-003", guest_id: guests[2].id, room_id: rooms[3].id, check_in: Date.today + 2, check_out: Date.today + 5, status: 0, adults: 2, children: 0 },
  { code: "RES-004", guest_id: guests[3].id, room_id: rooms[4].id, check_in: Date.today + 3, check_out: Date.today + 6, status: 0, adults: 1, children: 1 }
])

# ------------------------
# SERVICES
# ------------------------
services = Service.create!([
  { name: "Minibar", price: 8000, is_active: true },
  { name: "Massage", price: 25000, is_active: true },
  { name: "Laundry", price: 5000, is_active: true },
  { name: "Room Cleaning", price: 10000, is_active: true },
  { name: "Breakfast Buffet", price: 15000, is_active: true }
])

# ------------------------
# SERVICE USAGE
# ------------------------
ServiceUsage.create!([
  { reservation_id: reservations[0].id, service_id: services[0].id, quantity_integer: 2, used_at: DateTime.now, note: "2 drinks from minibar" },
  { reservation_id: reservations[0].id, service_id: services[2].id, quantity_integer: 1, used_at: DateTime.now, note: "Express laundry" },
  { reservation_id: reservations[1].id, service_id: services[1].id, quantity_integer: 1, used_at: DateTime.now, note: "Relaxing massage" },
  { reservation_id: reservations[2].id, service_id: services[3].id, quantity_integer: 1, used_at: DateTime.now, note: "Room cleaning service" },
  { reservation_id: reservations[3].id, service_id: services[4].id, quantity_integer: 2, used_at: DateTime.now, note: "Buffet breakfast for 2" }
])

# ------------------------
# INVOICES
# ------------------------
Invoice.create!([
  { reservation_id: reservations[0].id, nights_subtotal: 2 * rooms[0].price, services_subtotal: 21000, tax: 0.19 * (2 * rooms[0].price + 21000), total: (2 * rooms[0].price + 21000) * 1.19, issued_at: DateTime.now, status: "issued" },
  { reservation_id: reservations[1].id, nights_subtotal: 3 * rooms[1].price, services_subtotal: 25000, tax: 0.19 * (3 * rooms[1].price + 25000), total: (3 * rooms[1].price + 25000) * 1.19, issued_at: DateTime.now, status: "draft" },
  { reservation_id: reservations[2].id, nights_subtotal: 3 * rooms[3].price, services_subtotal: 10000, tax: 0.19 * (3 * rooms[3].price + 10000), total: (3 * rooms[3].price + 10000) * 1.19, issued_at: DateTime.now, status: "issued" },
  { reservation_id: reservations[3].id, nights_subtotal: 3 * rooms[4].price, services_subtotal: 30000, tax: 0.19 * (3 * rooms[4].price + 30000), total: (3 * rooms[4].price + 30000) * 1.19, issued_at: DateTime.now, status: "draft" }
])
