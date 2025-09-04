# Lab 3 — User Stories, Models & Seed Data

## Software description

Throughout this course, you will develop a Hotel Management System step by step, implementing new features in each lab as you learn different aspects of web application development. By the end of the semester, you will have a fully functional application capable of managing hotel operations from room reservations to final billing.

The application will allow hotel staff to:

- Manage rooms with their type (single, double, suite), status, and nightly rate.
- Register guests and keep track of their reservations and history.
- Create and manage reservations, including check-in and check-out processes.
- Assign rooms to reservations, ensuring availability and preventing overlapping bookings.
- Record additional services consumed during the stay (e.g., minibar items, massages, laundry).
- Generate invoices at check-out, automatically calculating:

  - Total nights × room rate
  - All additional services consumed
  - A 19% VAT applied to the final total

Across the 7 labs, you will progressively implement:

- Data modeling with rooms, guests, reservations, services, and invoices.
- CRUD operations for all main entities.
- Validations and business rules, such as room availability and capacity checks.
- Form handling and nested resources for managing service usage within reservations.
- State transitions for reservations (pending, confirmed, checked-in, checked-out, canceled).
- Automatic calculations for invoices, including subtotals, VAT, and totals.
- Optional authentication and authorization to restrict access to certain features.

By the end of the course, you will have a well-structured, maintainable, and realistic web application that mirrors real-world hotel management workflows. This project will give you practical experience in designing data models, building user interfaces, handling complex relationships, and applying business logic in a modern web framework.

## Objective
Define the functional requirements of the Hotel Management System using **User Stories** and set up the initial data model with migrations and seed data. No associations or validations are required in this lab.

## Instructions
1. **Write User Stories**
   - Based on the project description, define User Stories using the format:  
     *As a [type of user], I want [some feature] so that [some reason]*
   - Include stories for:
     - Room management
     - Guest registration
     - Reservation creation and room assignment
     - Service consumption tracking
     - Check-in and check-out
     - Invoice generation
   - Deliver the User Stories in a simple text or Markdown file before starting coding.

2. **Create Models & Migrations**
   - Generate the following models with attributes only (no associations or validations yet):
     - **Room**: `number:string`, `room_type:integer`, `price:integer`, `status:integer`
     - **Guest**: `first_name:string`, `last_name:string`, `email:string`, `phone:string`, `document_id:string`
     - **Reservation**: `code:string`, `guest_id:integer`, `room_id:integer`, `check_in:date`, `check_out:date`, `status:integer`, `adults:integer`, `children:integer`
     - **Service**: `name:string`, `price:integer`, `is_active:boolean`
     - **ServiceUsage**: `reservation_id:integer`, `service_id:integer`, `quantity:integer`, `used_at:datetime`, `note:text`
     - **Invoice**: `reservation_id:integer`, `nights_subtotal:integer`, `services_subtotal:integer`, `tax:integer`, `total:integer`, `issued_at:datetime`, `status:string`

3. **Seed Data**
   - Create a seed file with sample data for each table (no associations needed yet).

## Deliverables
- A file with all User Stories written clearly.
- Database schema with all tables created.
- Seed file populating sample data for rooms, guests, reservations, services, service usages, and invoices.


