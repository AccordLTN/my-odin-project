SELECT * FROM person;

SELECT name, age FROM pet;

SELECT name, age FROM pet WHERE dead = 0;

SELECT * FROM person WHERE first_name != "Zed";

SELECT * FROM person WHERE first_name = "Laura" AND age = "14" OR age = "27" AND first_name = "Meow";