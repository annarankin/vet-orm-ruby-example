SELECT DISTINCT ON (pets.id)
  pets.id AS id,
  users.id AS user_id,
  pets.name AS name,
  MIN(appointments.date) AS next_appointment_date
FROM users
INNER JOIN pets
  ON user_id = users.id
LEFT JOIN appointments
  ON pets.id = pet_id
  AND appointments.date >= CURRENT_DATE
GROUP BY (
  users.id,
  pets.id,
  pets.name
);
