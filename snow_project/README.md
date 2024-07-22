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
