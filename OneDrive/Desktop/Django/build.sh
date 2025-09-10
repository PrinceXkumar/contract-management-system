#!/bin/bash

# Install dependencies
pip install -r requirements.txt

# Collect static files
python vehicle_service_analytics/manage.py collectstatic --noinput

# Run migrations
python vehicle_service_analytics/manage.py migrate
