#!/bin/bash
gunicorn DriveProject.wsgi:application --access-logfile - --workers 3 --bind unix:/run/gunicorn.sock 
