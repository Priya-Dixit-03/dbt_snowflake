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

- ## `dbt` Materializations

This document explains the different types of materializations available in `dbt` (Data Build Tool) and provides examples for each type.

## Table of Contents

- [Table Materialization](#table-materialization)
- [View Materialization](#view-materialization)
- [Incremental Materialization](#incremental-materialization)
- [Ephemeral Materialization](#ephemeral-materialization)

## Table Materialization
** {{ config(materialized='table') }} **
**Table** materialization creates static tables. It stores the data in table form and recreates the entire table on each run.

## View Materialization
** {{ config(materialized='view') }} **
**View** materialization creates views that dynamically represent the underlying data. It uses less storage since it doesn't store data but fetches the query result dynamically.

## Incremental Materialization
** {{ config(materialized='incremental',unique_key='id') }} **

**Incremental** materialization handles incremental loads. It doesn't recreate the entire table on each run but only adds new and updated records.

## Ephemeral Materialization
**{{ config(materialized='ephemeral') }} **
**Ephemeral** materialization creates transient models used as CTEs (Common Table Expressions) within other models. It does not create actual tables or views.

# `dbt` Command Reference

This document explains various `dbt` (Data Build Tool) commands, their usage, and their functions.

## Table of Contents

- [Initialize Project](#initialize-project)
- [Develop Models](#develop-models)
- [Testing](#testing)
- [Compile Models](#compile-models)
- [Debugging](#debugging)
- [Seeding Data](#seeding-data)
- [Taking Snapshots](#taking-snapshots)
- [Generate Docs](#generate-docs)
- [Serve Docs](#serve-docs)
- [Run Operations](#run-operations)
- [Clean Project](#clean-project)
- [Install Dependencies](#install-dependencies)
- [Build](#build)
- [Compile with Select](#compile-with-select)
- [Parse](#parse)
- [Version](#version)

## Initialize Project

Initialize a new `dbt` project.
```sh
dbt init my_project

## Develop Models
Run models after writing and configuring them.
```sh
dbt run

## Testing
Run tests on models to ensure data quality and integrity.
```sh
dbt test

## Compile Models
Compile models without executing them, to check for syntax errors and generate compiled SQL files.
```sh
dbt compile

## Debugging
Check project and environment settings to debug issues.
```sh
dbt debug

## Seeding Data
Load CSV files into tables.
```sh
dbt seed

## Taking Snapshots
Create historical data snapshots.
```sh
dbt snapshot

##Generate Docs
Generate documentation for the project.
```sh
dbt docs generate

## Serve Docs
Serve the generated documentation on a web server for viewing.
```sh
dbt docs serve

## Run Operations
Run ad-hoc operations.
```sh
dbt run-operation my_operation

## Clean Project
Clean up generated directories.
```sh
dbt clean

## Install Dependencies
Install project dependencies.
```sh
dbt deps

## Build
Run models, tests, and snapshots in the correct order.
```sh
dbt build

## Compile with Select
Compile only selected models.
```sh
dbt compile --select model_name

## Parse
Check for syntax errors without running or compiling models.
```sh
dbt parse

## Version
Check the installed dbt version.
Check for syntax errors without running or compiling models.
```sh
dbt --version
