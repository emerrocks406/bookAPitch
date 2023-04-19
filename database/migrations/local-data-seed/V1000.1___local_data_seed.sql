do $$

declare USER_ID integer;
declare PITCH_ID integer;
declare BOOKING_ID integer;
declare ADDRESS_ID integer;
declare TIME_SLOT_ID integer;
declare PITCH_TIME_SLOT_ID integer;

begin

insert into app_user(email, first_name, last_name, password) values('emer@emer.com', 'Emer', 'Rocks', 'password') returning id into USER_ID;
insert into app_user(email, first_name, last_name, password) values('user@user.com', 'User', 'Test', 'userpassword') returning id into USER_ID;
insert into app_user(email, first_name, last_name, password) values('tester@test.com', 'Tester', 'Testing', 'testing') returning id into USER_ID;

insert into pitch(name) values('St.Pauls') returning id into PITCH_ID;
insert into pitch(name) values('St.Johns') returning id into PITCH_ID;
insert into pitch(name) values('St.Galls') returning id into PITCH_ID;

insert into time_slot(time_slot_start, time_slot_end) values('2017-01-01 00:00:00', '2017-01-01 01:00:00') returning id into TIME_SLOT_ID;
insert into pitch_time_slot(status, pitch_id, time_slot_id) values('available', PITCH_ID, TIME_SLOT_ID);

insert into time_slot(time_slot_start, time_slot_end) values('2020-04-11 13:00:00', '2020-04-11 14:00:00') returning id into TIME_SLOT_ID;
insert into pitch_time_slot(status, pitch_id, time_slot_id) values('booked', PITCH_ID, TIME_SLOT_ID);

insert into time_slot(time_slot_start, time_slot_end) values('2022-06-20 09:00:00', '2022-06-20 10:00:00') returning id into TIME_SLOT_ID;
insert into pitch_time_slot(status, pitch_id, time_slot_id) values('booked', PITCH_ID, TIME_SLOT_ID);

insert into time_slot(time_slot_start, time_slot_end) values('2022-06-20 11:00:00', '2022-06-20 12:00:00') returning id into TIME_SLOT_ID;
insert into pitch_time_slot(status, pitch_id, time_slot_id) values('available', PITCH_ID, TIME_SLOT_ID);

insert into time_slot(time_slot_start, time_slot_end) values('2022-06-20 12:00:00', '2022-06-20 13:00:00') returning id into TIME_SLOT_ID;
insert into pitch_time_slot(status, pitch_id, time_slot_id) values('booked', PITCH_ID, TIME_SLOT_ID) returning id into PITCH_TIME_SLOT_ID;

insert into address(name, address_line_1, address_line_2, region, zipcode) values( 'Emer', '4', 'test street', 'belfast', 'bt17kk') returning id into ADDRESS_ID;
insert into address(name, address_line_1, address_line_2, region, zipcode) values( 'User', '5', 'test street', 'belfast', 'bt17kj') returning id into ADDRESS_ID;
insert into address(name, address_line_1, address_line_2, region, zipcode) values( 'tester', '6', 'test street', 'belfast', 'bt17kw') returning id into ADDRESS_ID;

insert into pitch_address(pitch_id,address_id) values(PITCH_ID, ADDRESS_ID);

insert into booking(pitch_time_slot_id, description, booking_date) values(PITCH_TIME_SLOT_ID,'for a 3g pitch', '2012-04-11') returning id into BOOKING_ID;
insert into booking(pitch_time_slot_id, description, booking_date) values(PITCH_TIME_SLOT_ID,'for a grass pitch', '2023-04-11') returning id into BOOKING_ID;
insert into booking(pitch_time_slot_id, description, booking_date) values(PITCH_TIME_SLOT_ID,'for a training pitch', '2023-04-15') returning id into BOOKING_ID;

insert into user_booking(user_id, booking_id) values(USER_ID, BOOKING_ID);

end $$;