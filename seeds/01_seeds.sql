INSERT INTO users (name, email, password) VALUES 
  ('Matthew', 'Matthew@email.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'), 
  ('Adam', 'Adam@email.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'), 
  ('Johnny', 'Johnny@email.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');


INSERT INTO properties (
  owner_id, 
  title, 
  description, 
  thumbnail_photo_url, 
  cover_photo_url, 
  cost_per_night, 
  parking_spaces, 
  number_of_bathrooms, 
  number_of_bedrooms, 
  country, 
  street, 
  city,
  province, 
  post_code, 
  active) 
  VALUES (
  1,
  'Mytitle',
  'Mydescription',
  '<ThumbnailPhotoURL>',
  '<coverPhotoURL>',
  1000,
  2,
  2,
  2,
  'Canada',
  '1234 Street st',
  'Vancouver',
  'British Columbia',
  'V5K 1W1',
  'TRUE'
),
(
  2,
  'Mytitle',
  'Mydescription',
  '<ThumbnailPhotoURL>',
  '<coverPhotoURL>',
  1000,
  1,
  2,
  3,
  'Canada',
  '4321 Street st',
  'Vancouver',
  'British Columbia',
  'V5K 0W0',
  'TRUE'
),
(
  3,
  'Mytitle',
  'Mydescription',
  '<ThumbnailPhotoURL>',
  '<coverPhotoURL>',
  1000000,
  5,
  5,
  5,
  'Canada',
  '1234 Street st',
  'Vancouver',
  'British Columbia',
  'V5K 5W5',
  'TRUE'
);

/* Insert reservations */

INSERT INTO reservations (start_date, end_date, property_id, guest_id) 
-- start_date, 
-- end_date, 
-- property_id, 
-- guest_id
VALUES 
('2021-09-13', '2021-12-03', 1, 2), 
('2021-01-01', '2021-12-31', 3, 2), 
('2021-02-02', '2021-12-31', 2, 2);

/* Insert property_reviews */
INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message) 
VALUES 
(1, 1, 1, 5, 'great place 5/5'), 
(2, 2, 2, 1, 'had rats 0/5'), 
(3, 3, 3, 3, 'good vacation spot but food was bad 3/5');

