# Isracard Creative Analytics - Complete Looker Block

This is a complete Looker block that provides comprehensive creative performance analytics for Isracard's digital advertising campaigns across multiple platforms (Facebook, YouTube, DV360).

## 🏗️ Block Contents

### LookML Files
- **Models**: Data models with explores and joins
- **Views**: Dimensions, measures, and calculated fields
- **Dashboards**: Pre-built interactive dashboards
- **SQL**: Database schema and setup scripts

### Source Code Reference
- **React Components**: Original dashboard components for reference
- **TypeScript**: Type definitions and interfaces
- **Styling**: Tailwind CSS configuration and custom styles

## 📊 Available Dashboards

### 1. Creative Performance Overview
Main dashboard showing overall creative performance metrics with KPIs, platform comparison, and top performers.

### 2. Live Campaigns Monitoring  
Real-time monitoring of active campaigns with auto-refresh every 5 minutes.

### 3. Outlier Detection
Automated detection of underperforming and top performing creatives with alerts.

### 4. Creative Attributes Analysis
Performance analysis by creative format, video length, and other attributes.

## 🚀 Quick Start

1. **Deploy to Looker**: Import this block into your Looker instance
2. **Database Setup**: Run the SQL scripts to create required tables
3. **Configure Connection**: Set up database connection in the model
4. **Populate Data**: Load your creative performance data
5. **Access Dashboards**: Start analyzing your creative performance

## 📈 Key Features

- ✅ Real-time campaign monitoring
- ✅ Automated outlier detection  
- ✅ Interactive filtering and drill-downs
- ✅ Conditional formatting for quick insights
- ✅ Isracard brand colors and styling
- ✅ Mobile-responsive design

---

**Version**: 1.0  
**Maintainer**: Isracard Analytics Team & M:ad
\`\`\`

```lkml file="manifest.lkml"
project_name: "isracard_creative_analytics"

# Include all LookML files
include: "/models/*.model.lkml"
include: "/views/*.view.lkml" 
include: "/dashboards/*.dashboard.lookml"

# Use local_dependency: To enable referencing of another project
local_dependency: {
  project: "isracard_creative_analytics"
}

constant: VIS_LABEL {
  value: "Isracard Creative Analytics"
  export: override_optional
}

constant: CONNECTION_NAME {
  value: "creative_analytics_db"
  export: override_optional
}

# Datagroups define a caching policy for an Explore
datagroup: isracard_creative_analytics_default_datagroup {
  sql_trigger: SELECT MAX(updated_at) FROM creative_performance;;
  max_cache_age: "1 hour"
}

persist_with: isracard_creative_analytics_default_datagroup

# Color palette for Isracard branding
constant: ISRACARD_TEAL {
  value: "#0070BA"
}

constant: ISRACARD_PINK {
  value: "#E91E63"
}

constant: ISRACARD_BLACK {
  value: "#000000"
}
