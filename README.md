# Book A Pitch
## What is this application?
This is an application that will allow users within a GAA club book a pitch for training / matches on a calendar. There will be indications made on the calendar if a slot is free or booked.
## Why create this application?
The aim is to provide a user with the ability to book a pitch on the date and time that they need it. This application will also allow the user to see when a pitch booking has been cancelled or if a pitch becomes available last minute.
#### MVP:
 - Login
 - Calendar to show pitch bookings
 - Ability for user to create a booking request for an available date.
#### Stretch Goals:
 - Admin can accept a booking request for an available date.
 - A user can complete payment for an accepted booking request.
 - Automatically send email updates to users.
 - Admin / User  Creation
#### Domain Model:
```mermaid
flowchart 
 USER --- BOOKING
 BOOKING --- EMAIL
 PITCH --- ADDRESS 
 BOOKING --- PITCH
 USER --- EMAIL
 PITCH --- TIMESLOT
 BOOKING --- TIMESLOT
```
#### ER Diagram:
``` mermaid
erDiagram
address {
    int id PK
    string name
    string address_line_1
    string address_line_2
    string region
    string zipcode
    }
user {
    int id PK
    string first_name
    string last_name
    string email
    string password
    int booking_id FK
  }
booking_time_slot{
    int booking_id FK
    int time_slot_id FK
}
pitch{
    int id PK
    string name
    int booking_id FK
}
booking {
    int id PK
    string description
    date booking_date
    int user_id FK
}
time_slot {
    int id PK
    datetime time 
}
pitch_time_slot {
    int pitch_id FK
    int time_slot_id FK
}
pitch_address {
    int pitch_id FK
    int address_id FK
}
    user }|--|| booking : has
    pitch }|--|| booking : has
    booking }|--|| booking_time_slot : has
    time_slot }|--|| booking_time_slot : has
    pitch }|--|| pitch_time_slot : has
    time_slot }|--|| pitch_time_slot : has
    pitch }|--|| pitch_address : has
    address }|--|| pitch_address : ""
```
