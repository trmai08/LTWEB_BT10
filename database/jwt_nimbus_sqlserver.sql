-- ========================================================
-- DATABASE SCRIPT CHO MICROSOFT SQL SERVER
-- Database: AjaxRestfulDB
-- ========================================================

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AjaxRestfulDB')
BEGIN
    CREATE DATABASE AjaxRestfulDB;
END
GO

USE AjaxRestfulDB;
GO

-- Xóa bảng nếu đã tồn tại
IF OBJECT_ID('dbo.users', 'U') IS NOT NULL
    DROP TABLE dbo.users;
GO

-- Tạo bảng users
CREATE TABLE dbo.users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(100) UNIQUE NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name NVARCHAR(150) NULL,
    role VARCHAR(50) NOT NULL DEFAULT 'USER',
    enabled BIT NOT NULL DEFAULT 1,
    images VARCHAR(500) NULL,
    created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 DEFAULT CURRENT_TIMESTAMP
);
GO

-- Dữ liệu mẫu (mật khẩu mặc định: 123456 đã được mã hóa BCrypt)
INSERT INTO dbo.users (username, email, password, full_name, role, enabled)
VALUES 
('admin', 'admin@gmail.com', '$2a$10$3/2pW7k7aJmQoJ1f8rE78.h0YQW2z7E4J7qH0vY1E8V5s1l0G6Y5K', N'Administrator', 'ADMIN', 1),
('user', 'user@gmail.com', '$2a$10$3/2pW7k7aJmQoJ1f8rE78.h0YQW2z7E4J7qH0vY1E8V5s1l0G6Y5K', N'Nguyen Van A', 'USER', 1);
GO
