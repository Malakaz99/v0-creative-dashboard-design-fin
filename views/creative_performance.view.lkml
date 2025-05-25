view: creative_performance {
  sql_table_name: `isracard_analytics.creative_performance` ;;
  
  # Primary Key
  dimension: creative_performance_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.creative_performance_id ;;
    hidden: yes
  }
  
  # Creative Information
  dimension: creative_id {
    type: string
    sql: ${TABLE}.creative_id ;;
    label: "Creative ID"
  }
  
  dimension: creative_name {
    type: string
    sql: ${TABLE}.creative_name ;;
    label: "Creative Name"
    link: {
      label: "View Creative Details"
      url: "/dashboards/creative_details?creative_id={{ value }}"
    }
  }
  
  dimension: creative_image_url {
    type: string
    sql: ${TABLE}.creative_image_url ;;
    label: "Creative Image"
    html: <img src="{{ value }}" width="100" height="60" style="border-radius: 4px;"> ;;
  }
  
  # Platform Information
  dimension: platform_id {
    type: string
    sql: ${TABLE}.platform_id ;;
    hidden: yes
  }
  
  dimension: platform_name {
    type: string
    sql: ${TABLE}.platform_name ;;
    label: "Platform"
  }
  
  # Campaign Information
  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
    hidden: yes
  }
  
  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
    label: "Campaign"
  }
  
  dimension: campaign_status {
    type: string
    sql: ${TABLE}.campaign_status ;;
    label: "Campaign Status"
    html: 
      {% if value == 'Active' %}
        <span style="color: #16a34a; font-weight: bold;">● {{ value }}</span>
      {% elsif value == 'Live' %}
        <span style="color: #2563eb; font-weight: bold;">● {{ value }}</span>
      {% else %}
        <span style="color: #dc2626; font-weight: bold;">● {{ value }}</span>
      {% endif %} ;;
  }
  
  # Product Information
  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
    hidden: yes
  }
  
  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
    label: "Product"
  }
  
  # Audience Information
  dimension: audience_id {
    type: string
    sql: ${TABLE}.audience_id ;;
    hidden: yes
  }
  
  dimension: audience_type {
    type: string
    sql: ${TABLE}.audience_type ;;
    label: "Audience Type"
  }
  
  # Funnel Stage
  dimension: funnel_stage {
    type: string
    sql: ${TABLE}.funnel_stage ;;
    label: "Funnel Stage"
    html: 
      {% if value == 'Awareness' %}
        <span style="background-color: #0070BA; color: white; padding: 2px 8px; border-radius: 12px; font-size: 12px;">{{ value }}</span>
      {% elsif value == 'Mid' %}
        <span style="background-color: #E91E63; color: white; padding: 2px 8px; border-radius: 12px; font-size: 12px;">{{ value }}</span>
      {% elsif value == 'Conversion' %}
        <span style="background-color: #dc2626; color: white; padding: 2px 8px; border-radius: 12px; font-size: 12px;">{{ value }}</span>
      {% endif %} ;;
  }
  
  # Device and Placement
  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
    label: "Device Type"
  }
  
  dimension: placement {
    type: string
    sql: ${TABLE}.placement ;;
    label: "Placement"
  }
  
  # Date Dimensions
  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  
  dimension_group: start_date {
    type: time
    timeframes: [raw, date, week, month]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
    label: "Campaign Start"
  }
  
  # Performance Metrics
  measure: total_impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
    label: "Total Impressions"
    value_format: "#,##0"
    drill_fields: [creative_details*]
  }
  
  measure: total_clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
    label: "Total Clicks"
    value_format: "#,##0"
    drill_fields: [creative_details*]
  }
  
  measure: total_conversions {
    type: sum
    sql: ${TABLE}.conversions ;;
    label: "Total Conversions"
    value_format: "#,##0"
    drill_fields: [creative_details*]
  }
  
  measure: total_spend {
    type: sum
    sql: ${TABLE}.spend ;;
    label: "Total Spend"
    value_format: "$#,##0.00"
    drill_fields: [creative_details*]
  }
  
  measure: total_views {
    type: sum
    sql: ${TABLE}.views ;;
    label: "Total Views"
    value_format: "#,##0"
    drill_fields: [creative_details*]
  }
  
  # Calculated Metrics
  measure: ctr {
    type: number
    sql: SAFE_DIVIDE(${total_clicks}, ${total_impressions}) * 100 ;;
    label: "CTR (%)"
    value_format: "0.00\%"
    html: 
      {% if value >= 6.5 %}
        <span style="color: #16a34a;">{{ rendered_value }} ↗</span>
      {% else %}
        <span style="color: #dc2626;">{{ rendered_value }} ↘</span>
      {% endif %} ;;
  }
  
  measure: cvr {
    type: number
    sql: SAFE_DIVIDE(${total_conversions}, ${total_clicks}) * 100 ;;
    label: "CVR (%)"
    value_format: "0.00\%"
  }
  
  measure: cpa {
    type: number
    sql: SAFE_DIVIDE(${total_spend}, ${total_conversions}) ;;
    label: "CPA ($)"
    value_format: "$0.00"
    html: 
      {% if value &lt; 7.0 %}
        <span style="color: #16a34a;">{{ rendered_value }} ↗</span>
      {% else %}
        <span style="color: #dc2626;">{{ rendered_value }} ↘</span>
      {% endif %} ;;
  }
  
  measure: cpv {
    type: number
    sql: SAFE_DIVIDE(${total_spend}, ${total_views}) ;;
    label: "CPV ($)"
    value_format: "$0.0000"
  }
  
  measure: quality_score {
    type: average
    sql: ${TABLE}.quality_score ;;
    label: "Quality Score"
    value_format: "0.00"
    html: 
      {% if value > 2.5 %}
        <span style="color: #16a34a; font-weight: bold;">{{ rendered_value }}</span>
      {% else %}
        <span style="color: #dc2626; font-weight: bold;">{{ rendered_value }}</span>
      {% endif %} ;;
  }
  
  # Daily Metrics for Live Campaigns
  measure: daily_spend {
    type: average
    sql: ${TABLE}.daily_spend ;;
    label: "Daily Spend"
    value_format: "$#,##0"
  }
  
  measure: daily_impressions {
    type: average
    sql: ${TABLE}.daily_impressions ;;
    label: "Daily Impressions"
    value_format: "#,##0"
  }
  
  # Performance Indicators
  dimension: performance_tier {
    type: tier
    tiers: [2.0, 2.5, 3.0]
    style: integer
    sql: ${TABLE}.quality_score ;;
    label: "Performance Tier"
  }
  
  dimension: spend_tier {
    type: tier
    tiers: [1000, 5000, 10000]
    style: integer
    sql: ${TABLE}.spend ;;
    label: "Spend Tier"
  }
  
  # Outlier Detection
  dimension: is_outlier {
    type: yesno
    sql: ${TABLE}.is_outlier ;;
    label: "Is Outlier"
  }
  
  dimension: outlier_type {
    type: string
    sql: ${TABLE}.outlier_type ;;
    label: "Outlier Type"
  }
  
  dimension: variance_from_benchmark {
    type: string
    sql: ${TABLE}.variance_from_benchmark ;;
    label: "Variance from Benchmark"
  }
  
  # Drill Fields
  set: creative_details {
    fields: [
      creative_id,
      creative_name,
      platform_name,
      product_name,
      funnel_stage,
      audience_type,
      device_type,
      placement,
      total_impressions,
      total_clicks,
      total_conversions,
      total_spend,
      ctr,
      cvr,
      cpa,
      quality_score
    ]
  }
}
