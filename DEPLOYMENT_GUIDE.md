# Looker Block Deployment Guide

## Prerequisites
- Looker instance with admin access
- Database connection configured (BigQuery, Snowflake, etc.)
- Git repository access

## Step-by-Step Deployment

### 1. Database Setup
Run the SQL scripts to create the required tables:

\`\`\`sql
-- Execute sql/create_tables.sql in your data warehouse
-- This creates all necessary tables for the analytics
\`\`\`

### 2. Looker Project Setup
1. Create new LookML project in Looker
2. Connect to Git repository containing this block
3. Set connection to your data warehouse in the model file

### 3. File Structure Verification
Ensure these files exist in your repository:

\`\`\`
✅ manifest.lkml
✅ models/creative_performance.model.lkml
✅ views/*.view.lkml (7 files)
✅ dashboards/*.dashboard.lookml (4 files)
✅ sql/create_tables.sql
\`\`\`

### 4. Configuration
1. Update connection name in `models/creative_performance.model.lkml`
2. Modify table names if using different schema
3. Adjust datagroup triggers for your data refresh schedule

### 5. Validation
1. Validate LookML in development mode
2. Test explores and dashboards
3. Verify data is loading correctly
4. Check conditional formatting and visualizations

### 6. Production Deployment
1. Deploy to production
2. Set up user groups and permissions
3. Configure dashboard access
4. Train users on the new analytics

## Post-Deployment Checklist
- [ ] All dashboards load correctly
- [ ] Data is populating as expected
- [ ] Filters are working properly
- [ ] Conditional formatting displays correctly
- [ ] Real-time refresh is functioning (live campaigns)
- [ ] User permissions are set appropriately
- [ ] Performance is acceptable

## Troubleshooting
- **Missing Data**: Check database connection and table population
- **Slow Performance**: Verify datagroup caching is working
- **Permission Errors**: Ensure proper user access to explores and dashboards
- **Visualization Issues**: Check field references and join relationships

## Support
For technical support, contact your Looker administrator or the analytics team.
