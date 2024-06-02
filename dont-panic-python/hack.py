from cs50 import SQL


db = SQL("sqlite:///dont-panic.db")
password = input("Password: ")
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    password
)
db.execute(
    """
    UPDATE "user_logs"
    SET "new_password" = (
        SELECT "password" FROM "users"
        WHERE "username" = 'emily33'
    )
    WHERE "type" = 'update'
    AND "new_password" = '982c0381c279d139fd221fce974916e7'
    """
)

