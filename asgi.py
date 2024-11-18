from asgiref.wsgi import WsgiToAsgi

from app import create_app

app = WsgiToAsgi(create_app())
