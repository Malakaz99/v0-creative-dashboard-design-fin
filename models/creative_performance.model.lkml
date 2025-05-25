connection: "creative_analytics_db"

include: "/views/*.view.lkml"
include: "/dashboards/*.dashboard.lookml"

datagroup: creative_performance_default_datagroup {
  sql_trigger: SELECT MAX(updated_at) FROM creative_performance;;
  max_cache_age: "1 hour"
}

persist_with: creative_performance_default_datagroup

explore: creative_performance {
  label: "Creative Performance Analysis"
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
