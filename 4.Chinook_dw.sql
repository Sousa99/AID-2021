
DROP DATABASE IF EXISTS Chinook_dw;
CREATE DATABASE Chinook_dw;

USE Chinook_dw;

CREATE TABLE dim_track (
	TRACKID INT,
	TRACKNAME VARCHAR(255),
	TRACKALBUM VARCHAR(255),
	TRACKARTIST VARCHAR(255),
	PRIMARY KEY (TRACKID)
);

CREATE TABLE dim_customer (
	CUSTOMERID INT,
	CUSTOMERNAME VARCHAR(255),
	CITY VARCHAR(255),
	COUNTRY VARCHAR(255),
	PRIMARY KEY (CUSTOMERID)
);

CREATE TABLE dim_time (
	TIME_ID DATETIME,
	YEAR_ID INT,
	MONTH_ID INT,
	MONTH_NAME VARCHAR(255),
	DAY_ID INT,
	PRIMARY KEY (TIME_ID)
);

CREATE TABLE fact_invoice (
	INVOICEID INT,
	INVOICELINEID INT,
	QUANTITY INT,
	UNITPRICE DOUBLE,
	LINETOTAL DOUBLE,
	CUSTOMERID INT,
	TRACKID INT,
	INVOICEDATE DATETIME,
	PRIMARY KEY (INVOICEID, INVOICELINEID),
	FOREIGN KEY (TRACKID) REFERENCES dim_track (TRACKID),
	FOREIGN KEY (CUSTOMERID) REFERENCES dim_customer (CUSTOMERID),
	FOREIGN KEY (INVOICEDATE) REFERENCES dim_time (TIME_ID)
);
