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
  { number: "201", room_type: 2, price: 120000, status: 1 } # suite
])

# ------------------------
# GUESTS
# ------------------------
guests = Guest.create!([
  { first_name: "Ana", last_name: "Pérez", email: "ana@example.com", phone: "+56911111111", document_id: "12345678-9" },
  { first_name: "Carlos", last_name: "Soto", email: "carlos@example.com", phone: "+56922222222", document_id: "98765432-1" }
])

# ------------------------
# RESERVATIONS
# ------------------------
reservations = Reservation.create!([
  { code: "RES-001", guest_id: guests.first.id, room_id: rooms.first.id, check_in: Date.today, check_out: Date.today + 2, status: 0, adults: 1, children: 0 },
  { code: "RES-002", guest_id: guests.last.id, room_id: rooms.last.id, check_in: Date.today + 1, check_out: Date.today + 4, status: 1, adults: 2, children: 1 }
])

# ------------------------
# SERVICES
# ------------------------
services = Service.create!([
  { name: "Minibar", price: 8000, is_active: true },
  { name: "Masaje", price: 25000, is_active: true },
  { name: "Lavandería", price: 5000, is_active: true }
])

# ------------------------
# SERVICE USAGE
# ------------------------
ServiceUsage.create!([
  { reservation_id: reservations.first.id, service_id: services.first.id, quantity_integer: 2, used_at: DateTime.now, note: "2 bebidas" },
  { reservation_id: reservations.first.id, service_id: services.last.id, quantity_integer: 1, used_at: DateTime.now, note: "Lavado express" },
  { reservation_id: reservations.last.id, service_id: services.second.id, quantity_integer: 1, used_at: DateTime.now, note: "Masaje relajante" }
])

# ------------------------
# INVOICES
# ------------------------
Invoice.create!([
  { reservation_id: reservations.first.id, nights_subtotal: 2 * rooms.first.price, services_subtotal: 21000, tax: 0.19 * (2 * rooms.first.price + 21000), total: (2 * rooms.first.price + 21000) * 1.19, issued_at: DateTime.now, status: "issued" },
  { reservation_id: reservations.last.id, nights_subtotal: 3 * rooms.last.price, services_subtotal: 25000, tax: 0.19 * (3 * rooms.last.price + 25000), total: (3 * rooms.last.price + 25000) * 1.19, issued_at: DateTime.now, status: "draft" }
])
