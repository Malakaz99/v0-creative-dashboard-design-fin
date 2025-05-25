dashboard: creative_performance_overview {
  title: "Creative Performance Overview"
  description: "Main dashboard for Isracard creative performance analytics"
  
  element: top_campaigns {
    title: "Top Performing Campaigns"
    type: table
    query: {
      model: isracard_creative_analytics
      explore: creative_performance
      dimensions: [creative_performance.campaign_name, creative_performance.platform_name, creative_performance.product_name]
      measures: [creative_performance.total_impressions, creative_performance.total_clicks, creative_performance.total_conversions, creative_performance.total_spend, creative_performance.ctr, creative_performance.cvr, creative_performance.cpa, creative_performance.quality_score]
      sorts: [creative_performance.quality_score: desc]
      limit: 10
    }
  }
  
  element: platform_performance {
    title: "Platform Performance Comparison"
    type: column
    query: {
      model: isracard_creative_analytics
      explore: creative_performance
      dimensions: [creative_performance.platform_name]
      measures: [creative_performance.ctr, creative_performance.cvr, creative_performance.cpa]
      sorts: [creative_performance.ctr: desc]
    }
  }
  
  element: funnel_analysis {
    title: "Funnel Stage Performance"
    type: line
    query: {
      model: isracard_creative_analytics
      explore: creative_performance
      dimensions: [creative_performance.funnel_stage]
      measures: [creative_performance.ctr, creative_performance.cvr, creative_performance.cpa]
      sorts: [creative_performance.funnel_stage]
    }
  }
  
  element: kpi_impressions {
    title: "Total Impressions"
    type: single_value
    query: {
      model: isracard_creative_analytics
      explore: creative_performance
      measures: [creative_performance.total_impressions]
    }
  }
  
  element: kpi_conversions {
    title: "Total Conversions"
    type: single_value
    query: {
      model: isracard_creative_analytics
      explore: creative_performance
      measures: [creative_performance.total_conversions]
    }
  }
  
  element: kpi_spend {
    title: "Total Spend"
    type: single_value
    query: {
      model: isracard_creative_analytics
      explore: creative_performance
      measures: [creative_performance.total_spend]
    }
  }
  
  element: performance_trends {
    title: "Performance Trends Over Time"
    type: line
    query: {
      model: isracard_creative_analytics
      explore: creative_performance
      dimensions: [creative_performance.date_date]
      measures: [creative_performance.ctr, creative_performance.cvr, creative_performance.cpa]
      sorts: [creative_performance.date_date: desc]
      limit: 30
    }
  }
  
  element: outlier_detection {
    title: "Performance Outliers"
    type: table
    query: {
      model: isracard_creative_analytics
      explore: outlier_analysis
      dimensions: [outlier_analysis.creative_id, outlier_analysis.creative_name, outlier_analysis.platform_name, outlier_analysis.outlier_type, outlier_analysis.variance_from_benchmark]
      measures: [outlier_analysis.total_spend, outlier_analysis.cpa, outlier_analysis.quality_score]
      filters: {
        outlier_analysis.is_outlier: "yes"
      }
      sorts: [outlier_analysis.total_spend: desc]
      limit: 10
    }
  }
}
