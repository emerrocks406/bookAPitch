create table "user" (
    id serial PRIMARY KEY,
    email varchar NOT NULL,
    password varchar NOT NULL,
    first_name varchar NOT NULL,
    last_name varchar not NULL
)

create table booking (
	id serial primary key,
	pitch_time_slot_id integer not null,
	description varchar not null,
	booking_date date not null,
	CONSTRAINT fk_pitch_time_slot FOREIGN KEY (pitch_time_slot_id)
        REFERENCES pitch_time_slot(id) ON DELETE CASCADE
)

create table time_slot(
	id serial primary key,
	time_slot_start timestamp not null,
	time_slot_end timestamp not null
)

create table pitch (
	id serial primary key,
	name varchar not null
)

create table address (
	id serial primary key,
	name varchar not null,
	address_line_1 varchar not null,
	address_line_2 varchar not null,
	region varchar not null,
	zipcode varchar not null
)

create table pitch_time_slot (
	id serial primary key,
	pitch_id integer not null,
	time_slot_id integer not null,
	status varchar not null,
	CONSTRAINT fk_pitch_id FOREIGN KEY (pitch_id)
        REFERENCES pitch(id) on delete cascade,
    CONSTRAINT fk_time_slot_id FOREIGN KEY (time_slot_id)
        REFERENCES time_slot(id) on delete cascade
)

create table pitch_address (
	pitch_id integer not null,
	address_id integer not null,
	CONSTRAINT fk_pitch_id FOREIGN KEY (pitch_id)
        REFERENCES pitch(id) on delete cascade,
    CONSTRAINT fk_address_id FOREIGN KEY (address_id)
        REFERENCES address(id) on delete cascade
)

create table user_booking (
	user_id integer not null,
	booking_id integer not null,
	CONSTRAINT fk_user_id FOREIGN KEY (user_id)
        REFERENCES "user"(id) on delete cascade,
    CONSTRAINT fk_booking_id FOREIGN KEY (booking_id)
        REFERENCES booking(id) on delete cascade
)
