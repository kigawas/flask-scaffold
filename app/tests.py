#!/usr/bin/env python
import unittest

from app import create_app, db
from app.models import Table
from config import Config


class TestConfig(Config):
    TESTING = True
    SQLALCHEMY_DATABASE_URI = "sqlite://"


class ModelsTest(unittest.TestCase):
    def setUp(self):
        self.app = create_app(TestConfig)
        self.app_context = self.app.app_context()
        self.app_context.push()
        db.create_all()

    def tearDown(self):
        db.session.remove()
        db.drop_all()
        self.app_context.pop()

    def test_table(self):
        t = Table(id=1, hash="abc")
        db.session.add(t)
        db.session.commit()
        t = Table.query.filter_by(id=1).scalar()
        self.assertEqual(t.hash, "abc")
