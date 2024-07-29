Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


# DBT with PostgreSQL

## Overview

This guide provides instructions for setting up a DBT (Data Build Tool) project with PostgreSQL as the data warehouse. You will learn how to configure DBT to connect to PostgreSQL, create models, and manage data transformations.

## Prerequisites

1. **PostgreSQL Database**: Ensure you have access to a PostgreSQL database.
2. **DBT Installation**: Install DBT on your local machine or use a cloud-based environment.

   ```bash
   pip install dbt
   pip install dbt-postgres

## Create a DBT Project
Create a new DBT project by running:
dbt init postgres_project

## Configure DBT to Connect to PostgreSQL
Edit the profiles.yml file located in the .dbt directory (create the directory if it doesn’t exist). Add a profile configuration for PostgreSQL:
my_postgres_profile:
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      user: postgres
      password: your_postgres_password
      port: 5432
      dbname: postgres
      schema: public
	  
	
## Test Connection Using dbt debug
Run the dbt debug command to check if DBT can successfully connect to your PostgreSQL database:
dbt debug	
	  
Run Models: 
```bash
dbt run
```
# dbt Data Testing and Unit Testing

## Introduction

This document serves as a guide for implementing and understanding data tests and unit tests within a dbt (data build tool) project. dbt enables data analysts and engineers to transform data in their warehouse more effectively.

## Data Tests in dbt

### What are Data Tests?

Data tests in dbt are SQL queries that check the validity of your data. These tests help ensure that your data meets certain expectations and constraints.

## Unit Tests in dbt
### What are Unit Tests?
Unit tests in dbt are used to validate the logic in your models. They ensure that the transformations produce the expected results.

### Creating Data Tests

```bash
version: 2

models:
  - name: student_info
    description: "Overview of students with their calculated age"
    columns:
      - name: student_id
        description: "Unique identifier for each student"
      - name: first_name
        description: "First name of the student"
        tests:
          - not_null
          - unique
```
		  
		  
**Test Types:**
   - **Generic Tests:** Pre-defined tests such as `unique`, `not_null`.
   - **Custom Tests:** User-defined tests to address specific needs.
   
### Running Data Tests

To run the data tests, use the following command:
```bash
# run data and unit tests
dbt test

# run only data tests
dbt test --select test_type:data

# run only unit tests
dbt test --select test_type:unit


# run tests for one_specific_model
dbt test --select "one_specific_model"


# run tests for all models in package
dbt test --select "some_package.*"

# run data tests limited to one_specific_model
dbt test --select "one_specific_model,test_type:data"

# run unit tests limited to one_specific_model
dbt test --select "one_specific_model,test_type:unit"
 ```
# dbt Snapshots

## Introduction

This document serves as a guide for implementing and understanding snapshots within a dbt (data build tool) project. Snapshots in dbt allow you to capture the state of a table at different points in time, which is useful for slowly changing dimensions (SCDs) and historical data tracking.

## Creating Snapshots in dbt

### What are Snapshots?

Snapshots in dbt are used to capture the historical state of a table. This is useful for tracking changes over time and implementing slowly changing dimensions (SCDs).

### Creating a Snapshot

1. **Define a Snapshot:** Create a new SQL file in the `snapshots` directory of your dbt project. For example, `snapshots/customer_snapshot.sql`.

    ```bash
    sql
    {% snapshot customer_snapshot %}

    {{
        config(
          target_schema='snapshots',
          unique_key='customer_id',
          strategy='timestamp',
          updated_at='updated_at'
        )
    }}

    SELECT
        customer_id,
        customer_name,
        customer_email,
        updated_at
    FROM {{ source('raw', 'customers') }}

    {% endsnapshot %}
    ```
### Running Snapshots

To run the snapshots, use the following command:

```bash
dbt snapshot
```
### Summary

- **Setup DBT Project**: Initialize and configure DBT.
- **Connect to PostgreSQL**: Configure connection settings in `profiles.yml`.
- **Create Models**: Write SQL transformations and define them in the `models` directory.
- **Define Tests**: Add data quality tests in `schema.yml`.
- **Run and Test**: Use DBT commands to execute models and validate data.
