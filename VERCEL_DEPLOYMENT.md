# Vercel Deployment Guide

This guide will help you deploy your Node.js API to Vercel.

## Prerequisites

1. **Vercel Account**: Sign up at [vercel.com](https://vercel.com)
2. **Vercel CLI** (optional but recommended): Install globally
   ```bash
   npm install -g vercel
   ```

## Deployment Options

### Option 1: Deploy via Vercel CLI (Recommended)

1. **Login to Vercel**:
   ```bash
   vercel login
   ```

2. **Deploy your application**:
   ```bash
   vercel
   ```
   
   Follow the prompts:
   - Link to existing project? **N**
   - What's your project's name? **nodejs-docker-api** (or your preferred name)
   - In which directory is your code located? **./src**
   - Want to override the settings? **N**

3. **For production deployment**:
   ```bash
   vercel --prod
   ```

### Option 2: Deploy via GitHub Integration

1. **Push your code to GitHub**:
   ```bash
   git init
   git add .
   git commit -m "Initial commit for Vercel deployment"
   git branch -M main
   git remote add origin YOUR_GITHUB_REPO_URL
   git push -u origin main
   ```

2. **Connect to Vercel**:
   - Go to [vercel.com/dashboard](https://vercel.com/dashboard)
   - Click "New Project"
   - Import your GitHub repository
   - Vercel will automatically detect the settings from `vercel.json`
   - Click "Deploy"

## Project Configuration

The following files have been configured for Vercel deployment:

### `vercel.json`
- Configures Vercel to use Node.js runtime
- Routes all requests to your Express app
- Sets production environment variables
- Configures function timeout to 30 seconds

### `src/index.js`
- Modified to export the Express app for Vercel
- Only starts a server in development mode
- Compatible with both local development and Vercel deployment

### `package.json`
- Added `build` and `vercel-build` scripts
- Maintained existing Docker scripts for local development

## API Endpoints

After deployment, your API will be available at:

- **Base URL**: `https://your-project-name.vercel.app`
- **Health Check**: `https://your-project-name.vercel.app/api/health`
- **Users API**: `https://your-project-name.vercel.app/api/users`

## Environment Variables

If you need to add environment variables:

1. **Via Vercel CLI**:
   ```bash
   vercel env add NODE_ENV production
   ```

2. **Via Vercel Dashboard**:
   - Go to your project settings
   - Navigate to "Environment Variables"
   - Add your variables

## Local Development vs Production

- **Local Development**: Continue using `npm run dev` or Docker commands
- **Production**: Deployed automatically to Vercel

## Troubleshooting

### Common Issues:

1. **Function timeout**: If your API takes longer than 30 seconds, increase the timeout in `vercel.json`
2. **Missing dependencies**: Ensure all dependencies are in `package.json` dependencies (not devDependencies)
3. **Port issues**: Vercel handles ports automatically, no need to specify PORT in production

### Logs and Monitoring:

- View logs in Vercel dashboard
- Use `vercel logs` command for CLI access
- Monitor performance in Vercel Analytics

## Next Steps

1. Test your deployed API endpoints
2. Set up custom domain (optional)
3. Configure environment variables if needed
4. Set up continuous deployment via GitHub integration

## Support

- [Vercel Documentation](https://vercel.com/docs)
- [Node.js on Vercel](https://vercel.com/docs/concepts/functions/serverless-functions)
