from aiohttp import web
from aiohttp_wsgi import WSGIHandler

from app import create_app


def make_aiohttp_app(app):
    wsgi_handler = WSGIHandler(app)
    aioapp = web.Application()
    aioapp.router.add_route("*", "/{path_info:.*}", wsgi_handler)
    return aioapp


aioapp = make_aiohttp_app(create_app())
