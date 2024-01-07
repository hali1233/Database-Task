CREATE DATABASE IF NOT EXISTS task;
USE task;
DELIMITER / / CREATE PROCEDURE UserContent() BEGIN -- Create tables
 CREATE TABLE Content (
     question_id INT AUTO_INCREMENT PRIMARY KEY,
     question TEXT,
     answer_A TEXT,
     answer_B TEXT,
     answer_C TEXT,
     answer_D TEXT,
     correct_answer CHAR(1),
     image LONGBLOB,
    -- Assuming binary data for image
     answered_by_username VARCHAR(50)
 );
 CREATE TABLE Users (
     username INT AUTO_INCREMENT PRIMARY KEY,
     first_name VARCHAR(50),
     last_name VARCHAR(50),
     three_digit_number INT,
     wins INT,
     losses INT
 );
 CREATE TABLE NetworkInfo (
     Id INT AUTO_INCREMENT PRIMARY KEY,
     code VARCHAR(4),
     network_name VARCHAR(50)
 );
-- Insert data into content table
INSERT INTO Content (
        question,
        answer_A,
        answer_B,
        answer_C,
        answer_D,
        correct_answer,
        image,
        answered_by_username
    )
VALUES (
        'What is the color of the sky in the image? A. Red, B. Blue, C. Green, D. Orange',
        'Red',
        'Blue',
        'Green',
        'Orange',
        'B',
        LOAD_FILE('/Users/qbatch/Downloads/download (1).jpeg'),
        'user1'
    );
-- Insert data into users table
INSERT INTO Users (
        first_name,
        last_name,
        three_digit_number,
        wins,
        losses
    )
VALUES ('David', 'Warner', 789, 2, 1),
    ('John', 'Doe', 123, 5, 2),
    ('Charlas', 'Cris', 987, 4, 1),
    ('Jane', 'Smith', 456, 3, 1),
    ('David', 'Warner', 700, 2, 1),
    ('John', 'Doe', 313, 5, 2),
    ('Charlas', 'Cris', 100, 5, 1),
    ('Jane', 'Smith', 456, 3, 0),
    ('David', 'Warner', 789, 1, 1),
    ('John', 'Doe', 123, 5, 0),
    ('Charlas', 'Cris', 987, 4, 5),
    ('Jane', 'Smith', 456, 3, 3);
-- Insert data into networkinfo table
INSERT INTO NetworkInfo (code, network_name)
VALUES ('5G65', 'Library_Network_5G'),
    ('4F6I', 'Library_Network_4G'),
    ('9D22', 'Library_Network_3G'),
    ('6H73', 'Library_Network_2G'),
    ('5G64', 'Library_Network_5G'),
    ('4F65', 'Library_Network_4G'),
    ('9D26', 'Library_Network_3G'),
    ('6H77', 'Library_Network_2G'),
    ('5G68', 'Library_Network_5G'),
    ('4F69', 'Library_Network_4G'),
    ('9D10', 'Library_Network_3G'),
    ('6H11', 'Library_Network_2G');
-- List users by wins from highest to lowest
SELECT *
FROM Users
ORDER BY wins DESC;
END / / DELIMITER;
CALL UserContent;