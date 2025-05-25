dashboard: creative_attributes_dashboard {
  title: "Creative Attributes Analysis"
  description: "Performance analysis by creative format, length, and attributes"
  
  element: format_distribution {
    title: "Creative Format Distribution"
    type: pie
    query: {
      model: isracard_creative_analytics
      explore: creative_attributes_analysis
      dimensions: [creative_attributes.format]
      measures: [creative_performance.total_conversions]
      sorts: [creative_performance.total_conversions: desc]
    }
  }
  
  element: video_length_performance {
    title: "Video Length Performance"
    type: column
    query: {
      model: isracard_creative_analytics
      explore: creative_attributes_analysis
      dimensions: [creative_attributes.video_length]
      measures: [creative_performance.total_conversions, creative_performance.ctr, creative_performance.cpa]
      filters: {
        creative_attributes.format: "Video"
      }
      sorts: [creative_attributes.video_length_seconds]
    }
  }
  
  element: product_performance {
    title: "Product Performance Analysis"
    type: table
    query: {
      model: isracard_creative_analytics
      explore: creative_attributes_analysis
      dimensions: [creative_performance.product_name]
      measures: [creative_performance.total_conversions, creative_performance.ctr, creative_performance.cvr, creative_performance.cpa, creative_performance.quality_score]
      sorts: [creative_performance.total_conversions: desc]
    }
  }
  
  element: device_performance {
    title: "Device Performance Comparison"
    type: column
    query: {
      model: isracard_creative_analytics
      explore: creative_attributes_analysis
      dimensions: [creative_performance.device_type]
      measures: [creative_performance.total_conversions, creative_performance.ctr, creative_performance.cvr]
      sorts: [creative_performance.total_conversions: desc]
    }
  }
}
