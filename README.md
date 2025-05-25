# Isracard Creative Analytics - LookML Project

This LookML project provides comprehensive creative performance analytics for Isracard's digital advertising campaigns across multiple platforms (Facebook, YouTube, DV360).

## 🏗️ Project Structure

\`\`\`
isracard_creative_analytics/
├── manifest.lkml                          # Project configuration
├── models/
│   └── creative_performance.model.lkml    # Main data model with explores
├── views/
│   ├── creative_performance.view.lkml     # Core performance metrics
│   ├── creative_attributes.view.lkml      # Creative format/attributes
│   ├── platforms.view.lkml               # Platform information
│   ├── products.view.lkml                # Product categories
│   ├── live_campaigns.view.lkml          # Real-time campaign data
│   └── audience_segments.view.lkml       # Audience targeting data
├── dashboards/
│   ├── creative_performance_overview.dashboard.lookml
│   ├── live_campaigns.dashboard.lookml
│   ├── outlier_detection.dashboard.lookml
│   └── creative_attributes_analysis.dashboard.lookml
└── sql/
    └── create_tables.sql                  # Database schema
\`\`\`

## 📊 Available Dashboards

### 1. Creative Performance Overview
- **File**: `dashboards/creative_performance_overview.dashboard.lookml`
- **Purpose**: Main dashboard showing overall creative performance metrics
- **Key Features**:
  - Total impressions, clicks, conversions, spend
  - Platform performance comparison
  - Funnel stage analysis
  - Top performing creatives table

### 2. Live Campaigns Monitoring
- **File**: `dashboards/live_campaigns.dashboard.lookml`
- **Purpose**: Real-time monitoring of active campaigns
- **Key Features**:
  - Live campaign status
  - Real-time daily spend tracking
  - Active creative performance table
  - Auto-refresh every 5 minutes

### 3. Outlier Detection
- **File**: `dashboards/outlier_detection.dashboard.lookml`
- **Purpose**: Automated detection of performance outliers
- **Key Features**:
  - Underperforming creatives identification
  - Top performer highlights
  - Variance from benchmark analysis
  - Conditional formatting for quick insights

### 4. Creative Attributes Analysis
- **File**: `dashboards/creative_attributes_analysis.dashboard.lookml`
- **Purpose**: Performance analysis by creative attributes
- **Key Features**:
  - Format performance distribution (Video/Static/GIF)
  - Video length performance analysis
  - Product performance breakdown
  - Device performance comparison

## 🔍 Key Explores

### creative_performance
Main explore for analyzing creative performance across all dimensions:
- **Base Table**: `creative_performance`
- **Joined Tables**: campaigns, platforms, products, creative_attributes, audience_segments
- **Use Cases**: Overall performance analysis, trend analysis, comparative analysis

### live_campaigns
Specialized explore for real-time campaign monitoring:
- **Base Table**: `live_campaigns`
- **Joined Tables**: creative_performance, platforms
- **Use Cases**: Real-time monitoring, daily spend tracking, live performance alerts

## 📈 Key Metrics & Dimensions

### Performance Metrics
- **Impressions**: Total ad impressions
- **Clicks**: Total clicks on ads
- **Conversions**: Total conversions/acquisitions
- **Spend**: Total advertising spend
- **Views**: Total video views (where applicable)

### Calculated Metrics
- **CTR (%)**: Click-through rate
- **CVR (%)**: Conversion rate
- **CPA ($)**: Cost per acquisition
- **CPV ($)**: Cost per view
- **Quality Score**: Composite performance score (1-5 scale)

### Key Dimensions
- **Platform**: Facebook, YouTube, DV360
- **Product**: Loans, Credit Cards, Benefits, B2B
- **Funnel Stage**: Awareness, Mid-Funnel, Conversion
- **Audience Type**: Prospecting, Remarketing, Lookalike
- **Device Type**: Mobile, Desktop
- **Creative Format**: Video, Static, GIF
- **Video Length**: 15s, 30s, 45s, 60s+

## 🎨 Branding & Colors

The project uses Isracard's brand colors:
- **Primary Teal**: #0070BA
- **Secondary Pink**: #E91E63
- **Accent Black**: #000000

## 🔧 Setup Instructions

1. **Database Connection**: Ensure your Looker instance is connected to the `creative_analytics_db` database
2. **Table Creation**: Run the SQL scripts in `sql/create_tables.sql` to create the required tables
3. **Data Population**: Populate tables with your creative performance data
4. **Deploy**: Deploy this LookML project to your Looker instance
5. **Permissions**: Set appropriate user permissions for dashboard access

## 📊 Data Refresh

- **Caching**: 1-hour cache policy for optimal performance
- **Live Data**: Live campaigns refresh every 5 minutes
- **Trigger**: Data refreshes when `creative_performance.updated_at` changes

## 🚀 Usage Examples

### Finding Underperforming Creatives
\`\`\`sql
SELECT creative_id, creative_name, platform_name, cpa, quality_score
FROM creative_performance 
WHERE quality_score < 2.0 
AND spend > 1000
ORDER BY spend DESC;
\`\`\`

### Top Performing Video Lengths
\`\`\`sql
SELECT video_length, AVG(ctr) as avg_ctr, AVG(cvr) as avg_cvr
FROM creative_performance cp
JOIN creative_attributes ca ON cp.creative_id = ca.creative_id
WHERE format = 'Video'
GROUP BY video_length
ORDER BY avg_ctr DESC;
\`\`\`

## 🔍 Troubleshooting

### Common Issues
1. **Missing Data**: Check database connection and table population
2. **Slow Performance**: Verify datagroup caching is working
3. **Permission Errors**: Ensure proper user access to explores and dashboards

### Support
For technical support or questions about this LookML project, contact the Isracard Analytics Team.

---

**Last Updated**: 2024-05-25  
**Version**: 1.0  
**Maintainer**: Isracard Analytics Team & M:ad
\`\`\`

Now let me create a deployment guide:
