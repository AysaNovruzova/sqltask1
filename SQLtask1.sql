CREATE TABLE Movie (
    MovieID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL,
    DirectorID INT,
    FOREIGN KEY (DirectorID) REFERENCES Director(DirectorID)
);

CREATE TABLE Genre (
    GenreID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL
);

CREATE TABLE Director (
    DirectorID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL
);

CREATE TABLE Actor (
    ActorID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL
);

CREATE TABLE MovieActor (
    MovieID INT,
    ActorID INT,
    PRIMARY KEY (MovieID, ActorID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (ActorID) REFERENCES Actor(ActorID)
);

CREATE TABLE Review (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    MovieID INT,
    ReviewerName NVARCHAR(255),
    Rating INT CHECK(Rating >= 1 AND Rating <= 10),
    Comment NVARCHAR(MAX),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);
