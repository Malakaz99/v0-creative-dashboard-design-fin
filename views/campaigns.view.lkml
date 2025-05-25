view: campaigns {
  sql_table_name: `isracard_analytics.campaigns` ;;
  
  dimension: campaign_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.campaign_id ;;
    hidden: yes
  }
  
  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
    label: "Campaign Name"
  }
  
  dimension: campaign_type {
    type: string
    sql: ${TABLE}.campaign_type ;;
    label: "Campaign Type"
  }
  
  dimension: campaign_objective {
    type: string
    sql: ${TABLE}.campaign_objective ;;
    label: "Campaign Objective"
  }
  
  dimension_group: campaign_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.campaign_start_date ;;
    label: "Campaign Start"
  }
  
  dimension_group: campaign_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.campaign_end_date ;;
    label: "Campaign End"
  }
  
  dimension: campaign_budget {
    type: number
    sql: ${TABLE}.campaign_budget ;;
    label: "Campaign Budget"
    value_format: "$#,##0"
  }
  
  measure: total_campaign_budget {
    type: sum
    sql: ${campaign_budget} ;;
    label: "Total Campaign Budget"
    value_format: "$#,##0"
  }
  
  measure: campaign_count {
    type: count
    label: "Number of Campaigns"
  }
  
  measure: avg_campaign_budget {
    type: average
    sql: ${campaign_budget} ;;
    label: "Average Campaign Budget"
    value_format: "$#,##0"
  }
}
