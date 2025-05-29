CREATE DATABASE MyWebAppDB;
GO

USE MyWebAppDB;
GO
CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Roles (
    RoleId INT PRIMARY KEY IDENTITY(1,1),
    RoleName NVARCHAR(50) NOT NULL
);
CREATE TABLE UserRoles (
    UserId INT,
    RoleId INT,
    PRIMARY KEY(UserId, RoleId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (RoleId) REFERENCES Roles(RoleId)
);
CREATE TABLE Posts (
    PostId INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(200) NOT NULL,
    Content NVARCHAR(MAX),
    AuthorId INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (AuthorId) REFERENCES Users(UserId)
);
-- Insert sample roles
INSERT INTO Roles (RoleName) VALUES ('Admin'), ('User');

-- Insert sample user
INSERT INTO Users (Username, Email, PasswordHash)
VALUES ('testuser', 'test@example.com', 'hashedpassword123');

-- Assign role to user
INSERT INTO UserRoles (UserId, RoleId) VALUES (1, 2); -- User gets 'User' role

-- Insert a post
INSERT INTO Posts (Title, Content, AuthorId)
VALUES ('Welcome Post', 'This is the first post on the web app.', 1);
