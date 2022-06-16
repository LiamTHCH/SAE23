#!/bin/bash
gunicorn DriveProject.wsgi:application --access-logfile - --workers 3 --bind 0.0.0.0
