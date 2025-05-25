connection: "creative_analytics_db"

# Include all view and dashboard files using wildcards
include: "*.view.lkml"
include: "*.dashboard.lookml"

datagroup: isracard_creative_analytics_default_datagroup {
  sql_trigger: SELECT MAX(updated_at) FROM creative_performance;;
  max_cache_age: "1 hour"
}

persist_with: isracard_creative_analytics_default_datagroup

explore: creative_performance {
  label: "Creative Performance"
  description: "Comprehensive analysis of creative performance across platforms"
  
  join: campaigns {
    type: left_outer
    sql_on: ${creative_performance.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }
  
  join: platforms {
    type: left_outer
    sql_on: ${creative_performance.platform_id} = ${platforms.platform_id} ;;
    relationship: many_to_one
  }
  
  join: products {
    type: left_outer
    sql_on: ${creative_performance.product_id} = ${products.product_id} ;;
    relationship: many_to_one
  }
  
  join: creative_attributes {
    type: left_outer
    sql_on: ${creative_performance.creative_id} = ${creative_attributes.creative_id} ;;
    relationship: one_to_one
  }
  
  join: audience_segments {
    type: left_outer
    sql_on: ${creative_performance.audience_id} = ${audience_segments.audience_id} ;;
    relationship: many_to_one
  }
}

explore: live_campaigns {
  label: "Live Campaign Monitoring"
  description: "Real-time monitoring of active campaigns"
  
  join: creative_performance {
    type: left_outer
    sql_on: ${live_campaigns.creative_id} = ${creative_performance.creative_id} ;;
    relationship: one_to_many
  }
  
  join: platforms {
    type: left_outer
    sql_on: ${live_campaigns.platform_id} = ${platforms.platform_id} ;;
    relationship: many_to_one
  }
}

explore: outlier_analysis {
  label: "Outlier Detection"
  description: "Automated detection of performance outliers"
  from: creative_performance
  
  join: creative_attributes {
    type: left_outer
    sql_on: ${outlier_analysis.creative_id} = ${creative_attributes.creative_id} ;;
    relationship: one_to_one
  }
  
  join: platforms {
    type: left_outer
    sql_on: ${outlier_analysis.platform_id} = ${platforms.platform_id} ;;
    relationship: many_to_one
  }
}

explore: creative_attributes_analysis {
  label: "Creative Attributes Analysis"
  description: "Performance analysis by creative format, length, and attributes"
  from: creative_performance
  
  join: creative_attributes {
    type: left_outer
    sql_on: ${creative_attributes_analysis.creative_id} = ${creative_attributes.creative_id} ;;
    relationship: one_to_one
  }
  
  join: platforms {
    type: left_outer
    sql_on: ${creative_attributes_analysis.platform_id} = ${platforms.platform_id} ;;
    relationship: many_to_one
  }
  
  join: products {
    type: left_outer
    sql_on: ${creative_attributes_analysis.product_id} = ${products.product_id} ;;
    relationship: many_to_one
  }
}
