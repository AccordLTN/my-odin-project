SELECT pet.id, pet.name, pet.age, pet.dead
	FROM pet, person_pet, person
	WHERE
	pet.id = person_pet.pet_id AND
	person_pet.person_id = person.id AND
	person.first_name = "Laura";

SELECT pet.name, pet.age
	FROM pet, person_pet, person
	WHERE
	pet.dead = 0 AND
	pet.id = person_pet.pet_id AND
	person_pet.person_id = person.id AND
	person.first_name = "Zed";