# Vercel Deployment Guide

## Prerequisites
1. A Vercel account
2. A PostgreSQL database (Vercel Postgres or external service like Supabase, Railway, etc.)

## Steps to Deploy

### 1. Prepare Your Repository
Make sure all the necessary files are committed:
- `vercel.json`
- `requirements.txt`
- `runtime.txt`
- Updated `settings.py`

### 2. Set Up Database
1. Create a PostgreSQL database (Vercel Postgres, Supabase, Railway, etc.)
2. Get your database connection URL

### 3. Deploy to Vercel
1. Connect your GitHub repository to Vercel
2. Set the following environment variables in Vercel dashboard:
   - `SECRET_KEY`: Generate a new Django secret key
   - `DEBUG`: Set to `False` for production
   - `DATABASE_URL`: Your PostgreSQL connection string

### 4. Run Migrations
After deployment, you'll need to run migrations. You can do this by:
1. Using Vercel CLI: `vercel env pull .env.local` then run migrations locally
2. Or create a management command to run migrations on deployment

### 5. Create Superuser
You'll need to create a superuser for admin access. This can be done through:
1. Django shell on Vercel
2. Or create a management command

## Environment Variables Required
```
SECRET_KEY=your-secret-key-here
DEBUG=False
DATABASE_URL=postgresql://username:password@host:port/database
```

## Common Issues and Solutions

### 1. Static Files Not Loading
- Make sure `whitenoise` is properly configured
- Check that `STATIC_ROOT` is set correctly
- Ensure static files are collected during build

### 2. Database Connection Issues
- Verify `DATABASE_URL` is correctly formatted
- Ensure `dj-database-url` is in requirements.txt
- Check that PostgreSQL is accessible from Vercel

### 3. Import Errors
- Make sure all dependencies are in `requirements.txt`
- Check that `PYTHONPATH` is set correctly in vercel.json

### 4. Function Timeout
- The `maxLambdaSize` is set to 50mb in vercel.json
- Consider optimizing your code if you hit limits

## Testing Locally
To test the production setup locally:
1. Set environment variables
2. Run `python vehicle_service_analytics/manage.py collectstatic`
3. Run `python vehicle_service_analytics/manage.py migrate`
4. Run `python vehicle_service_analytics/manage.py runserver`
