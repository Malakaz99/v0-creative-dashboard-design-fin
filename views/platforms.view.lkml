view: platforms {
  sql_table_name: `isracard_analytics.platforms` ;;
  
  dimension: platform_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.platform_id ;;
    hidden: yes
  }
  
  dimension: platform_name {
    type: string
    sql: ${TABLE}.platform_name ;;
    label: "Platform"
  }
  
  dimension: platform_category {
    type: string
    sql: ${TABLE}.platform_category ;;
    label: "Platform Category"
  }
  
  dimension: platform_color {
    type: string
    sql: 
      CASE 
        WHEN ${platform_name} = 'Facebook' THEN '#1877F2'
        WHEN ${platform_name} = 'YouTube' THEN '#FF0000'
        WHEN ${platform_name} = 'DV360' THEN '#4285F4'
        ELSE '#666666'
      END ;;
    hidden: yes
  }
  
  measure: platform_count {
    type: count
    label: "Number of Platforms"
  }
}
