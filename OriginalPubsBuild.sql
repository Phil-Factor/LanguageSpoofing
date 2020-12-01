USE master;
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'PubsTest') SET NOEXEC ON;

EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'PubsTest';
GO

ALTER DATABASE PubsTest SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
USE master;
GO
/****** Object:  Database [PubsTest]    Script Date: 30/11/2020 09:50:56 ******/
DROP DATABASE PubsTest;
GO
SET NOEXEC OFF;
CREATE DATABASE PubsTest CONTAINMENT = NONE;
GO
USE PubsTest;
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default = 1
                                                     AND name = N'PRIMARY'
              ) ALTER DATABASE PubsTest MODIFY FILEGROUP [PRIMARY] DEFAULT;
GO


EXECUTE sp_addtype id, 'varchar(11)', 'NOT NULL';
EXECUTE sp_addtype tid, 'varchar(6)', 'NOT NULL';
EXECUTE sp_addtype empid, 'char(9)', 'NOT NULL';

RAISERROR('Now at the create table section ....', 0, 1);

GO

CREATE TABLE authors
  (
  au_id id
    CHECK (au_id LIKE '[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]') CONSTRAINT UPKCL_auidind PRIMARY KEY CLUSTERED,
  au_lname NVARCHAR(80) NOT NULL,
  au_fname NVARCHAR(80) NOT NULL,
  phone NVARCHAR(40) NOT NULL DEFAULT ('UNKNOWN'),
  address NVARCHAR(80) NULL,
  city NVARCHAR(40) NULL,
  state CHAR(2) NULL,
  zip CHAR(5) NULL CHECK (zip LIKE '[0-9][0-9][0-9][0-9][0-9]'),
  contract BIT NOT NULL
  );

GO

CREATE TABLE publishers
  (
  pub_id CHAR(4) NOT NULL CONSTRAINT UPKCL_pubind PRIMARY KEY CLUSTERED
    CHECK (pub_id IN ('1389', '0736', '0877', '1622', '1756')
        OR pub_id LIKE '99[0-9][0-9]'
          ),
  pub_name NVARCHAR(100) NULL,
  city NVARCHAR(100) NULL,
  state CHAR(2) NULL,
  country NVARCHAR(80) NULL DEFAULT ('USA')
  );

GO

CREATE TABLE titles
  (
  title_id tid CONSTRAINT UPKCL_titleidind PRIMARY KEY CLUSTERED,
  title NVARCHAR(255) NOT NULL,
  type NVARCHAR(80) NOT NULL DEFAULT ('UNDECIDED'),
  pub_id CHAR(4) NULL REFERENCES publishers (pub_id),
  price MONEY NULL,
  advance MONEY NULL,
  royalty INT NULL,
  ytd_sales INT NULL,
  notes NVARCHAR(4000) NULL,
  pubdate DATETIME NOT NULL DEFAULT (GetDate())
  );

GO

CREATE TABLE titleauthor
  (
  au_id id REFERENCES authors (au_id),
  title_id tid REFERENCES titles (title_id),
  au_ord TINYINT NULL,
  royaltyper INT NULL,
  CONSTRAINT UPKCL_taind PRIMARY KEY CLUSTERED (au_id, title_id)
  );

GO

CREATE TABLE stores
  (
  stor_id CHAR(4) NOT NULL CONSTRAINT UPK_storeid PRIMARY KEY CLUSTERED,
  stor_name NVARCHAR(80) NULL,
  stor_address NVARCHAR(80) NULL,
  city NVARCHAR(40) NULL,
  state CHAR(2) NULL,
  zip CHAR(5) NULL
  );

GO

CREATE TABLE sales
  (
  stor_id CHAR(4) NOT NULL REFERENCES stores (stor_id),
  ord_num NVARCHAR(40) NOT NULL,
  ord_date DATETIME NOT NULL,
  qty SMALLINT NOT NULL,
  payterms NVARCHAR(40) NOT NULL,
  title_id tid REFERENCES titles (title_id),
  CONSTRAINT UPKCL_sales PRIMARY KEY CLUSTERED (stor_id, ord_num, title_id)
  );

GO

CREATE TABLE roysched
  (
  roysched_id INT IDENTITY(1, 1) PRIMARY KEY,
  title_id tid REFERENCES titles (title_id),
  lorange INT NULL,
  hirange INT NULL,
  royalty INT NULL
  );

GO

CREATE TABLE discounts
  (
  Discount_id INT IDENTITY(1, 1) PRIMARY KEY,
  discounttype NVARCHAR(80) NOT NULL,
  stor_id CHAR(4) NULL REFERENCES stores (stor_id),
  lowqty SMALLINT NULL,
  highqty SMALLINT NULL,
  discount DEC(4, 2) NOT NULL
  );

GO

CREATE TABLE jobs
  (
  job_id SMALLINT IDENTITY(1, 1) PRIMARY KEY CLUSTERED,
  job_desc VARCHAR(50) NOT NULL
    DEFAULT 'New Position - title not formalized yet',
  min_lvl TINYINT NOT NULL CHECK (min_lvl >= 10),
  max_lvl TINYINT NOT NULL CHECK (max_lvl <= 250)
  );

GO

CREATE TABLE pub_info
  (
  pub_id CHAR(4) NOT NULL REFERENCES publishers (pub_id) CONSTRAINT UPKCL_pubinfo PRIMARY KEY CLUSTERED,
  logo IMAGE NULL,
  pr_info TEXT NULL
  );

GO

CREATE TABLE employee
  (
  emp_id empid CONSTRAINT PK_emp_id PRIMARY KEY NONCLUSTERED
    CONSTRAINT CK_emp_id CHECK (emp_id LIKE '[A-Z][A-Z][A-Z][1-9][0-9][0-9][0-9][0-9][FM]'
                             OR emp_id LIKE '[A-Z]-[A-Z][1-9][0-9][0-9][0-9][0-9][FM]'
                               ),
  fname NVARCHAR(40) NOT NULL,
  minit CHAR(1) NULL,
  lname NVARCHAR(60) NOT NULL,
  job_id SMALLINT NOT NULL DEFAULT 1 REFERENCES jobs (job_id),
  job_lvl TINYINT DEFAULT 10,
  pub_id CHAR(4) NOT NULL DEFAULT ('9952') REFERENCES publishers (pub_id),
  hire_date DATETIME NOT NULL DEFAULT (GetDate())
  );

GO

RAISERROR('Now at the create trigger section ...', 0, 1);

GO

CREATE TRIGGER employee_insupd
ON employee
FOR INSERT, UPDATE
AS
--Get the range of level for this job type from the jobs table.
DECLARE @min_lvl TINYINT, @max_lvl TINYINT, @emp_lvl TINYINT,
  @job_id SMALLINT;
SELECT @min_lvl = min_lvl, @max_lvl = max_lvl, @emp_lvl = i.job_lvl,
  @job_id = i.job_id
  FROM employee e, jobs j, inserted i
  WHERE e.emp_id = i.emp_id AND i.job_id = j.job_id;
IF (@job_id = 1) AND (@emp_lvl <> 10)
  BEGIN
    RAISERROR('Job id 1 expects the default level of 10.', 16, 1);
    ROLLBACK TRANSACTION;
  END;
ELSE IF NOT (@emp_lvl BETWEEN @min_lvl AND @max_lvl)
       BEGIN
         RAISERROR(
                    'The level for job_id:%d should be between %d and %d.',
                    16,
                    1,
                    @job_id,
                    @min_lvl,
                    @max_lvl
                  );
         ROLLBACK TRANSACTION;
       END;

GO

GO

RAISERROR('Now at the create index section ....', 0, 1) WITH NOWAIT;

GO

CREATE CLUSTERED INDEX employee_ind ON employee (lname, fname, minit);

GO

CREATE NONCLUSTERED INDEX aunmind ON authors (au_lname, au_fname);
GO
CREATE NONCLUSTERED INDEX titleidind ON sales (title_id);
GO
CREATE NONCLUSTERED INDEX titleind ON titles (title);
GO
CREATE NONCLUSTERED INDEX auidind ON titleauthor (au_id);
GO
CREATE NONCLUSTERED INDEX titleidind ON titleauthor (title_id);
GO
CREATE NONCLUSTERED INDEX titleidind ON roysched (title_id);
GO

RAISERROR('Now at the create view section ....', 0, 1);

GO

CREATE VIEW titleview
AS
SELECT title, au_ord, au_lname, price, ytd_sales, pub_id
  FROM authors, titles, titleauthor
  WHERE authors.au_id = titleauthor.au_id
    AND titles.title_id = titleauthor.title_id;

GO

RAISERROR('Now at the create procedure section ....', 0, 1);

GO

CREATE PROCEDURE byroyalty @percentage INT
AS
SELECT au_id FROM titleauthor WHERE titleauthor.royaltyper = @percentage;

GO

CREATE PROCEDURE reptq1
AS
SELECT CASE WHEN Grouping(pub_id) = 1 THEN 'ALL' ELSE pub_id END AS pub_id,
  Avg(price) AS avg_price
  FROM titles
  WHERE price IS NOT NULL
  GROUP BY pub_id WITH ROLLUP
  ORDER BY pub_id;

GO

CREATE PROCEDURE reptq2
AS
SELECT CASE WHEN Grouping(type) = 1 THEN 'ALL' ELSE type END AS type,
  CASE WHEN Grouping(pub_id) = 1 THEN 'ALL' ELSE pub_id END AS pub_id,
  Avg(ytd_sales) AS avg_ytd_sales
  FROM titles
  WHERE pub_id IS NOT NULL
  GROUP BY pub_id, type WITH ROLLUP;

GO

CREATE PROCEDURE reptq3 @lolimit MONEY, @hilimit MONEY, @type CHAR(12)
AS
SELECT CASE WHEN Grouping(pub_id) = 1 THEN 'ALL' ELSE pub_id END AS pub_id,
  CASE WHEN Grouping(type) = 1 THEN 'ALL' ELSE type END AS type,
  Count(title_id) AS cnt
  FROM titles
  WHERE price > @lolimit
    AND price < @hilimit
    AND type = @type
     OR type LIKE '%cook%'
  GROUP BY pub_id, type WITH ROLLUP;

GO

UPDATE STATISTICS publishers;
UPDATE STATISTICS employee;
UPDATE STATISTICS jobs;
UPDATE STATISTICS pub_info;
UPDATE STATISTICS titles;
UPDATE STATISTICS authors;
UPDATE STATISTICS titleauthor;
UPDATE STATISTICS sales;
UPDATE STATISTICS roysched;
UPDATE STATISTICS stores;
UPDATE STATISTICS discounts;

GO

CHECKPOINT;

GO