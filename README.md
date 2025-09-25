<<<<<<< HEAD
# Lab 5 — Associations & Validations

## Objective
Connect the database tables using proper associations and add basic validations. Update seeds accordingly.

## Instructions
1. Add associations to models:
   - A **Guest** has many **Reservations**.
   - A **Room** has many **Reservations**.
   - A **Reservation** belongs to one **Guest** and one **Room**.
   - A **Reservation** has many **ServiceUsages**.
   - A **ServiceUsage** belongs to one **Service** and one **Reservation**.
   - An **Invoice** belongs to one **Reservation**.
2. Add validations:
   - Presence of required fields (e.g., names, codes, dates).
   - Unique codes for reservations.
   - Room price and service price must be non-negative.
3. Update seed data to respect associations and validations.

## Deliverables
- Models updated with associations and validations.
- Seed file adjusted to create valid associated records.


=======