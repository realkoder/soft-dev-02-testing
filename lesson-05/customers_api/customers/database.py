import sqlite3
import click

from flask import current_app, g

def init_app(app):
    app.teardown_appcontext(close_db)
    app.cli.add_command(init_db)

@click.command('init-db')
def init_db():
    db = get_db()

    with current_app.open_resource('customers.sql') as schema_and_data:
        db.executescript(schema_and_data.read().decode('utf-8'))

def get_db():
    if 'db' not in g:
        g.db = sqlite3.connect(
            current_app.config['DATABASE'],
            detect_types=sqlite3.PARSE_DECLTYPES
        )

    return g.db

def close_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()

def format_db_data(data):
    return {
        'Customer ID': data[0],
        'First Name': data[1],
        'Last Name': data[2],
        'Phone No': data[3],
        'Address': data[4],
        'Onboarding Date': data[5]
    }
