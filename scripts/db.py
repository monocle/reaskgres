from typing import List, Tuple
from dotenv import dotenv_values
import psycopg as pg
from psycopg.rows import dict_row, DictRow


class Postgres:
    app_db_names = {"development", "test"}
    db_prefix = "postgres"
    user: str
    password: str
    host: str
    port: str

    def __init__(self, env_vars=None):
        if env_vars is None:
            env_vars = dotenv_values(".env")

        for attr in ["user", "password", "host", "port"]:
            env_var_name = (self.db_prefix + "_" + attr).upper()
            value = env_vars.get(env_var_name)

            if not value:
                exit("Missing environment variable: " + env_var_name)

            setattr(self, attr, value)

    def connect(self, autocommit=False):
        return pg.connect(
            user=self.user,
            password=self.password,
            host=self.host,
            port=self.port,
            autocommit=autocommit,
        )

    def fetch_all(self, sql: str) -> List[DictRow]:
        with self.connect() as conn:
            with conn.cursor(row_factory=dict_row) as cursor:
                return cursor.execute(sql).fetchall()

    def fetch_all_databases(self) -> List[DictRow]:
        sql = """SELECT *
                 FROM pg_database
                 WHERE datistemplate = false
                 ORDER BY datname ASC"""
        return self.fetch_all(sql)

    def create_database(self, name: str):
        # Don't usually want to use unsanitzed inputs directly in
        # SQL strings. However, using %s placeholder wasn't working.
        sql = "CREATE DATABASE " + name

        # Can't use transaction block for database creation
        conn = self.connect(autocommit=True)
        conn.execute(sql).close()

    def drop_database(self, name: str):
        sql = "DROP DATABASE " + name
        conn = self.connect(autocommit=True)
        conn.execute(sql).close()

    @property
    def database_names(self):
        return {db["datname"] for db in self.fetch_all_databases()}
