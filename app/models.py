from typing import Any

from app import db

Model: Any = db.Model


class Table(Model):
    __tablename__ = "table"
    id = db.Column(db.Integer, primary_key=True)
    hash = db.Column(db.String(64), unique=True, nullable=False)
