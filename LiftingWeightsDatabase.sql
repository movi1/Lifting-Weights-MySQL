-- Drop the database if it already exists
DROP DATABASE IF EXISTS LiftingWeightsDatabase;

-- Create the database
CREATE DATABASE LiftingWeightsDatabase;

-- Use the newly created database
USE LiftingWeightsDatabase;

-- Create the 'exercises' table
DROP TABLE IF EXISTS exercises;
CREATE TABLE exercises (
    exercise_id INT NOT NULL,
    exercise_name VARCHAR(255) NOT NULL,
    muscle_group VARCHAR(255) NOT NULL,
    PRIMARY KEY (exercise_id)
);

-- Insert data into the 'exercises' table
INSERT INTO exercises VALUES 
(1,'Bench Press','Chest'),
(2,'Squat','Legs'),
(3,'Bicep Curl','Arms'),
(4,'Shoulder Press','Shoulders');

-- Create the 'sets' table
DROP TABLE IF EXISTS sets;
CREATE TABLE sets (
    set_id INT NOT NULL,
    exercise_id INT NOT NULL,
    weight INT NOT NULL,
    reps INT NOT NULL,
    PRIMARY KEY (set_id),
    FOREIGN KEY (exercise_id) REFERENCES exercises(exercise_id)
);

-- Insert data into the 'sets' table
INSERT INTO sets VALUES 
(1,1,135,8),
(2,1,145,8),
(3,1,155,8),
(4,2,225,8),
(5,2,235,8),
(6,2,245,8),
(7,3,35,8),
(8,3,40,8),
(9,3,45,8),
(10,4,65,8),
(11,4,70,8),
(12,4,75,8);

-- Create the 'users' table
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    User_ID INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    PRIMARY KEY (User_ID)
);

-- Insert data into the 'users' table
INSERT INTO users VALUES 
(1,'John',34,'Male'),
(2,'Movi',43,'Female'),
(3,'Jason',28,'Male'),
(4,'Rachel',26,'Female'),
(5,'Michael',23,'Male');

-- Create the 'workouts' table
DROP TABLE IF EXISTS workouts;
CREATE TABLE workouts (
    workout_id INT NOT NULL,
    workout_date DATE NOT NULL,
    workout_duration TIME NOT NULL,
    PRIMARY KEY (workout_id)
);

-- Insert data into the 'workouts' table
INSERT INTO workouts VALUES 
(1,'2022-12-22','00:00:00'),
(2,'2022-12-19','01:10:00'),
(3,'2022-12-22','55:00:00'),
(4,'2022-12-22','01:00:00'),
(6,'2022-12-22','00:00:00');

-- Create the 'workoutexercises' table
DROP TABLE IF EXISTS workoutExercises;
CREATE TABLE workoutExercises (
    workout_id INT NOT NULL,
    exercise_id INT NOT NULL,
    PRIMARY KEY (workout_id, exercise_id),
    FOREIGN KEY (workout_id) REFERENCES workouts(workout_id),
    FOREIGN KEY (exercise_id) REFERENCES exercises(exercise_id)
);

-- Insert data into the 'workoutexercises' table
INSERT INTO workoutExercises VALUES 
(1,1),
(3,1),
(1,2),
(3,2),
(1,3),
(2,3),
(1,4),
(2,4);



SELECT * FROM users LIMIT 0, 1000;

SELECT w.workout_id, e.exercise_name, e.muscle_group, s.weight, s.reps
FROM workouts w
JOIN workoutexercises we ON w.workout_id = we.workout_id
JOIN exercises e ON we.exercise_id = e.exercise_id
JOIN sets s ON e.exercise_id = s.exercise_id;





