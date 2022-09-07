# Azure-Modern-Data-Warehouse
Building an Azure Data Warehouse for Bike Share Data Analytics. Project to load data from Postgres DB in Azure into Azure Synapse.

## Overview of Project

Divvy is a bike sharing program in Chicago, Illinois USA that allows riders to purchase a pass at a kiosk or use a mobile application to unlock a bike at stations around the city and use the bike for a specified amount of time. The bikes can be returned to the same station or to another station. The City of Chicago makes the anonymized bike trip data publicly available for projects like this where we can analyze the data.

Since the data from Divvy are anonymous, we have created fake rider and account profiles along with fake payment data to go along with the data from Divvy


The goal of this project is to develop a data warehouse solution using Azure Synapse Analytics. You will:



### Design a star schema based on the business outcomes listed below;
* Import the data into Synapse;
* Transform the data into the star schema;
* and finally, view the reports from Analytics.

### The business outcomes you are designing for are as follows:
* Analyze how much time is spent per ride
    * Based on date and time factors such as day of week and time of day
    * Based on which station is the starting and / or ending station
    * Based on age of the rider at time of the ride
    * Based on whether the rider is a member or a casual rider

* Analyze how much money is spent
    * Per month, quarter, year
    * Per member, based on the age of the rider at account start

* EXTRA CREDIT - Analyze how much money is spent per member
    * Based on how many rides the rider averages per month
    * Based on how many minutes the rider spends on a bike per month


## Preparation
We will be utilizing a PostgreSQL 11 server for storing and retrieving data and Docker for hosting it. To do this, first install Docker: https://docs.docker.com/.


Once installed, run the following commands in your terminal:
1. To run the server:
`docker run -d --name ht_pg_server -v ht_dbdata:/var/lib/postgresql/data -p 54320:5432 postgres:11`
2. Check the logs to see if it is running:
`docker logs -f ht_pg_server`
3. Create the database:
`docker exec -it ht_pg_server psql -U postgres -c "create database ht_db"`
4. Modify paths in the config.py script and run it to load the csv data into the DB. Then populate the database:
`python etl.py`

## Interacting with the DB
In the first part of the home task you will be required to utilize the DB to query the data. If you are unfamiliar with PostgreSQL, we recommend installing DBeaver (Mac, Windows, Linux) or Postico.

For Postico visit: https://eggerapps.at/postico/. 
Once installed, open Postico and:
1. click 'New Favorite'
2. enter the following:
- Nickname: ht_db
- Host: localhost
- Port: 54320
- User: postgres
- Database: ht_db
3. click 'Done' and 'Connect' 
and you should be able to see the data you just loaded to the database.

## Data

- name: rider.csv
  schema: |
    rider_id int primary key not null,
    address varchar(255),
    first varchar(255),
    last varchar(255),
    birthday date,
    account_number int foreign key not null

- name: account.csv
  schema: |
    account_number int primary key not null,
    member bool,
    start_date date,
    end_date date

- name: payment.csv
  schema: |
    payment_id int primary key not null,
    date date,
    amount decimal, 
    account_number int foreign key not null

- name: trip.csv
  schema: |
    trip_id int primary key not null,
    rideable_type string, 
    started_at datetime,
    ended_at datetime,
    start_station_id int foreign key not null, 
    end_station_id int foreign key not null, 
    member_id int foreign key not null

- name: station.csv
  schema: |
    station_id int primary key not null,
    name string,
    longitude float,
    latitude float

![Divy ERD](/images/divvy_erd.png)


## Task 1: Create your Azure resources
* Create an Azure PostgreSQL database
* Create an Azure Synapse workspace
* Create a Dedicated SQL Pool and database within the Synapse workspace

## Task 2: Design a star schema
You are being provided a relational schema that describes the data as it exists in PostgreSQL. In addition, you have been given a set of business requirements related to the data warehouse. You are being asked to design a star schema using fact and dimension tables.

![Star Schema](/images/star_schema_design.png)

## Task 3: Create the data in PostgreSQL
To prepare your environment for this project, you first must create the data in PostgreSQL. This will simulate the production environment where the data is being used in the OLTP system. 



## Task 4: EXTRACT the data from PostgreSQL
In your Azure Synapse workspace, you will use the ingest wizard to create a one-time pipeline that ingests the data from PostgreSQL into Azure Blob Storage. This will result in all four tables being represented as text files in Blob Storage, ready for loading into the data warehouse.

[Azure Example](https://docs.microsoft.com/en-us/azure/data-factory/load-azure-sql-data-warehouse?tabs=data-factory)

## Task 5: LOAD the data into external tables in the data warehouse
Once in Blob storage, the files will be shown in the data lake node in the Synapse Workspace. From here, you can use the script generating function to load the data from blob storage into external staging tables in the data warehouse you created using the Dedicated SQL Pool.



## Task 6: TRANSFORM the data to the star schema
You will write SQL scripts to transform the data from the staging tables to the final star schema you designed.

