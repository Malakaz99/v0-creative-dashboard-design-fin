view: audience_segments {
  sql_table_name: `isracard_analytics.audience_segments` ;;
  
  dimension: audience_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.audience_id ;;
    hidden: yes
  }
  
  dimension: audience_name {
    type: string
    sql: ${TABLE}.audience_name ;;
    label: "Audience Name"
  }
  
  dimension: audience_type {
    type: string
    sql: ${TABLE}.audience_type ;;
    label: "Audience Type"
  }
  
  dimension: audience_size {
    type: number
    sql: ${TABLE}.audience_size ;;
    label: "Audience Size"
    value_format: "#,##0"
  }
  
  dimension: demographic_profile {
    type: string
    sql: ${TABLE}.demographic_profile ;;
    label: "Demographic Profile"
  }
  
  measure: total_audience_size {
    type: sum
    sql: ${audience_size} ;;
    label: "Total Audience Size"
    value_format: "#,##0"
  }
  
  measure: audience_count {
    type: count
    label: "Number of Audience Segments"
  }
  
  measure: avg_audience_size {
    type: average
    sql: ${audience_size} ;;
    label: "Average Audience Size"
    value_format: "#,##0"
  }
}
