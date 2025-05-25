view: live_campaigns {
  sql_table_name: `isracard_analytics.live_campaigns` ;;
  
  dimension: campaign_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.campaign_id ;;
    hidden: yes
  }
  
  dimension: creative_id {
    type: string
    sql: ${TABLE}.creative_id ;;
    hidden: yes
  }
  
  dimension: platform_id {
    type: string
    sql: ${TABLE}.platform_id ;;
    hidden: yes
  }
  
  dimension: is_live {
    type: yesno
    sql: ${TABLE}.is_live ;;
    label: "Is Live"
  }
  
  dimension_group: last_updated {
    type: time
    timeframes: [raw, time, date, hour]
    sql: ${TABLE}.last_updated ;;
    label: "Last Updated"
  }
  
  measure: live_campaigns_count {
    type: count
    filters: [is_live: "yes"]
    label: "Live Campaigns Count"
  }
  
  measure: total_daily_spend_live {
    type: sum
    sql: ${TABLE}.daily_spend ;;
    filters: [is_live: "yes"]
    label: "Total Daily Spend (Live)"
    value_format: "$#,##0"
  }
  
  measure: all_campaigns_count {
    type: count
    label: "Total Campaigns Count"
  }
}
