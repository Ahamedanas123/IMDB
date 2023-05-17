create database imdbtask;
use imdbtask;

-- Create table for Movies
CREATE TABLE Movies (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  release_date DATE,
  description TEXT
);

-- Create table for Media (Images or Videos)
CREATE TABLE Media (
  id INT PRIMARY KEY AUTO_INCREMENT,
  movie_id INT,
  type ENUM('image', 'video'),
  url VARCHAR(255),
  FOREIGN KEY (movie_id) REFERENCES Movies(id)
);

-- Create table for Genres
CREATE TABLE Genres (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)
);

-- Create table for Movies-Genres relationship (many-to-many)
CREATE TABLE Movie_Genre (
  id INT PRIMARY KEY AUTO_INCREMENT,
  movie_id INT,
  genre_id INT,
  FOREIGN KEY (movie_id) REFERENCES Movies(id),
  FOREIGN KEY (genre_id) REFERENCES Genres(id)
);

-- Create table for Users
CREATE TABLE Users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  email VARCHAR(255)
);

-- Create table for Reviews
CREATE TABLE Reviews (
  id INT PRIMARY KEY AUTO_INCREMENT,
  movie_id INT,
  user_id INT,
  rating DECIMAL(3,2),
  comment TEXT,
  FOREIGN KEY (movie_id) REFERENCES Movies(id),
  FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Create table for Artists
CREATE TABLE Artists (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)
);

-- Create table for Skills
CREATE TABLE Skills (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)
);

-- Create table for Artist-Skills relationship (many-to-many)
CREATE TABLE Artist_Skill (
  id INT PRIMARY KEY AUTO_INCREMENT,
  artist_id INT,
  skill_id INT,
  FOREIGN KEY (artist_id) REFERENCES Artists(id),
  FOREIGN KEY (skill_id) REFERENCES Skills(id)
);

-- Create table for Artist-Role relationship (many-to-many)
CREATE TABLE Artist_Role (
  id INT PRIMARY KEY AUTO_INCREMENT,
  artist_id INT,
  movie_id INT,
  role VARCHAR(255),
  FOREIGN KEY (artist_id) REFERENCES Artists(id),
  FOREIGN KEY (movie_id) REFERENCES Movies(id)
);
-- Insert sample records into Movies table
INSERT INTO Movies (title, release_date, description)
VALUES ('The Shawshank Redemption', '1994-09-23', 'Two imprisoned men bond over several years...'),
       ('The Godfather', '1972-03-24', 'The aging patriarch of an organized crime dynasty...'),
       ('Pulp Fiction', '1994-10-14', 'The lives of two mob hitmen, a boxer, a gangster...');

-- Insert sample records into Media table
INSERT INTO Media (movie_id, type, url)
VALUES (1, 'image', 'https://www.imdb.com/title/tt0111161/'),
       (3, 'image', 'https://www.bing.com/images/search?q=Pulp+Fiction&form=HDRSC3&first=1'),
       (2, 'image', 'https://www.bing.com/images/search?q=The+Godfather&go=Search&qs=ds&form=QBIR');

-- Insert sample records into Genres table
INSERT INTO Genres (name)
VALUES ('Drama'),
       ('Crime'),
       ('Thriller');

-- Insert sample records into Movie_Genre table
INSERT INTO Movie_Genre (movie_id, genre_id)
VALUES (1, 1),
       (1, 2),
       (3, 1),
       (3, 2),
       (3, 3);

-- Insert sample records into Users table
INSERT INTO Users (name, email)
VALUES ('John Doe', 'johndoe@example.com'),
       ('Jane Smith', 'janesmith@example.com');

-- Insert sample records into Reviews table
INSERT INTO Reviews (movie_id, user_id, rating, comment)
VALUES (1, 1, 9.3, 'Great movie!'),
       (1, 2, 9.5, 'One of my all-time favorites.'),
       (3, 1, 8.7, 'Unique and groundbreaking film.');

-- Insert sample records into Artists table
INSERT INTO Artists (name)
VALUES ('Morgan Freeman'),
       ('Marlon Brando'),
       ('Samuel L. Jackson');

-- Insert sample records into Skills table
INSERT INTO Skills (name)
VALUES ('Acting'),
       ('Directing'),
       ('Screenwriting');

-- Insert sample records into Artist_Skill table
INSERT INTO Artist_Skill (artist_id, skill_id)
VALUES (1, 1),
       (1, 3),
       (2, 1),
       (3, 1),
       (3, 2);

-- Insert sample records into Artist_Role table
INSERT INTO Artist_Role (artist_id, movie_id, role)
VALUES (1, 1, 'Actor'),
       (2, 2, 'Actor'),
       (3, 3, 'Actor'),
       (3, 3, 'Director');
       select * from movies;