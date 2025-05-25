dashboard: live_campaigns_dashboard {
  title: "Live Campaigns Monitoring"
  description: "Real-time monitoring dashboard for active campaigns"
  refresh: 5 minutes
  
  element: live_status {
    title: "Live Campaigns Count"
    type: single_value
    query: {
      model: isracard_creative_analytics
      explore: live_campaigns
      measures: [live_campaigns.live_campaigns_count]
    }
  }
  
  element: daily_spend {
    title: "Total Daily Spend (Live)"
    type: single_value
    query: {
      model: isracard_creative_analytics
      explore: live_campaigns
      measures: [live_campaigns.total_daily_spend_live]
    }
  }
  
  element: live_performance_table {
    title: "Live Campaign Performance"
    type: table
    query: {
      model: isracard_creative_analytics
      explore: live_campaigns
      dimensions: [creative_performance.creative_id, creative_performance.creative_name, creative_performance.platform_name, creative_performance.product_name, creative_performance.campaign_status]
      measures: [creative_performance.daily_spend, creative_performance.daily_impressions, creative_performance.ctr, creative_performance.cvr, creative_performance.quality_score]
      filters: {
        live_campaigns.is_live: "yes"
      }
      sorts: [creative_performance.daily_spend: desc]
      limit: 20
    }
  }
}
