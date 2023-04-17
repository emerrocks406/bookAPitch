do $$

declare USER_ID integer;
declare PITCH_ID integer;
declare BOOKING_ID integer;
declare ADDRESS_ID integer;
declare TIME_SLOT_ID integer;
declare PITCH_TIME_SLOT_ID integer;

begin

insert into "user"(email, first_name, last_name, password)
values('emer@emer.com', 'Emer', 'Rocks', 'password') returning id into USER_ID;
	
insert into pitch("name")
values('St.Pauls') returning id into PITCH_ID;

insert into address("name", address_line_1, address_line_2, region, zipcode)
values( 'test address', '4', 'test street', 'belfast', 'bt17kk')
returning id into ADDRESS_ID;

insert into time_slot(time_slot_start, time_slot_end)
values('2017-01-01 00:00:00', '2017-01-01 01:00:00')
returning id into TIME_SLOT_ID;

​insert into time_slot(time_slot_start, time_slot_end)
values('2020-04-11 13:00:00', '2020-04-11 14:00:00')
returning id into TIME_SLOT_ID;

insert into time_slot(time_slot_start, time_slot_end)
values('2022-06-20 09:00:00', '2022-06-20 10:00:00')
returning id into TIME_SLOT_ID;

insert into time_slot(time_slot_start, time_slot_end)
values('2022-06-20 11:00:00', '2022-06-20 12:00:00')
returning id into TIME_SLOT_ID;

insert into time_slot(time_slot_start, time_slot_end)
values('2022-06-20 12:00:00', '2022-06-20 13:00:00')
returning id into TIME_SLOT_ID;

insert into pitch_time_slot(status, pitch_id, time_slot_id)
values('available', PITCH_ID, TIME_SLOT_ID);

insert into booking(PITCH_TIME_SLOT_ID, description, booking_date)
values((select id from pitch_time_slot where status='available'),'for a 3g pitch', '2012-04-11')
returning id into BOOKING_ID;

insert into user_booking(user_id, booking_id)
values(USER_ID, BOOKING_ID);
​
insert into pitch_address(pitch_id,address_id)
values(PITCH_ID, ADDRESS_ID);
​
end $$;