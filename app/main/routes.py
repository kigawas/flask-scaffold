from flask import jsonify, current_app as app

from app.main import bp
from app.errors.handlers import error_response


@bp.route("/")
def index():
    app.logger.warn("Hello")
    return jsonify(hello="scaffold")


@bp.route("/log")
def log():
    app.logger.debug("This is a debug log, you can only see it when app.debug is True")
    app.logger.info("Some info")
    app.logger.warn("Warning")
    app.logger.error("Something was broken")
    return jsonify(log="ok")


@bp.route("/redis/<key>", methods=["GET"])
def get_redis_value(key):
    v = app.redis.get(key) or b""
    return jsonify(result=v.decode())


@bp.route("/redis/<key>/<value>", methods=["PUT"])
def set_redis_value(key, value):
    return jsonify(set=app.redis.set(key, value))


@bp.route("/error/<int:code>")
def error(code):
    app.logger.error(f"Error: {code}")
    return error_response(code)
