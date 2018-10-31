#!/bin/sh
flask db migrate
flask db upgrade
