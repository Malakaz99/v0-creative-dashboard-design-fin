# Looker Deployment Guide

## Prerequisites
- Looker instance with admin access
- Database connection configured
- Git repository access

## Step-by-Step Deployment

### 1. Database Setup
\`\`\`sql
-- Run the table creation scripts
-- File: sql/create_tables.sql
\`\`\`

### 2. Looker Project Setup
1. Create new LookML project in Looker
2. Connect to Git repository
3. Set connection to `creative_analytics_db`

### 3. File Structure Verification
Ensure these files exist in your repository:
\`\`\`
✅ manifest.lkml
✅ models/creative_performance.model.lkml
✅ views/*.view.lkml (6 files)
✅ dashboards/*.dashboard.lookml (4 files)
\`\`\`

### 4. Validation
1. Validate LookML in development mode
2. Test explores and dashboards
3. Deploy to production

### 5. User Access
1. Set up user groups
2. Assign dashboard permissions
3. Configure data access policies

## Post-Deployment Checklist
- [ ] All dashboards load correctly
- [ ] Data is populating as expected
- [ ] Filters are working properly
- [ ] Conditional formatting displays correctly
- [ ] Real-time refresh is functioning (live campaigns)
- [ ] User permissions are set appropriately

## Monitoring
- Monitor query performance
- Check data freshness
- Review user adoption metrics
- Validate data accuracy regularly
