# dbt_snowflake
**Step 1**: Guides you through installing dbt using pip 
   - python -m venv dbt-env
   - source dbt-env/bin/activate         # activate the environment for Mac and Linux OR
     dbt-env\Scripts\activate            # activate the environment for Windows
   - python -m pip install dbt-core
   - python -m pip install dbt-snowflake
   - mkdir $home\.dbt
   - dbt init

**Step 2**:  set up your Snowflake credentials in a `profiles.yml` file.
    - <account_name>: Your Snowflake account name (e.g., example for example.snowflakecomputing.com).
     <username>: Your Snowflake username.
     <password>: Your Snowflake password.
     <role>: Your Snowflake role.
     <database_name>: The name of your Snowflake database.
    <warehouse_name>: The name of your Snowflake warehouse.
    <schema_name>: The name of your Snowflake schema.

**Step 3**:  how to verify your setup by checking dbt installation and Snowflake connection.
      - dbt debug

**Step 4**: Instructions for running your first dbt project against Snowflake.
    - dbt run
  


- **Additional Resources**: Links to dbt and Snowflake documentation for further learning.


