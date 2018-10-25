import os

basedir = os.path.abspath(os.path.dirname(__file__))


class Config(object):
    SECRET_KEY = os.environ.get("SECRET_KEY") or "hard-to-guess"
    SQLALCHEMY_DATABASE_URI = os.environ.get(
        "DATABASE_URL"
    ) or "sqlite:///" + os.path.join(basedir, "app.db")
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    REDIS_URL = os.environ.get("REDIS_URL") or "redis://localhost:6379/1"


class Development(Config):
    A_SPECIAL_CONFIG = ""


class Production(Config):
    A_SPECIAL_CONFIG = ""


CONFIG_MAP = {"development": Development, "production": Production}
