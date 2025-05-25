view: creative_attributes {
  sql_table_name: `isracard_analytics.creative_attributes` ;;
  
  dimension: creative_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.creative_id ;;
    hidden: yes
  }
  
  dimension: format {
    type: string
    sql: ${TABLE}.format ;;
    label: "Creative Format"
  }
  
  dimension: video_length {
    type: string
    sql: ${TABLE}.video_length ;;
    label: "Video Length"
  }
  
  dimension: video_length_seconds {
    type: number
    sql: 
      CASE 
        WHEN ${TABLE}.video_length = '15s' THEN 15
        WHEN ${TABLE}.video_length = '30s' THEN 30
        WHEN ${TABLE}.video_length = '45s' THEN 45
        WHEN ${TABLE}.video_length = '60s+' THEN 60
        ELSE NULL
      END ;;
    label: "Video Length (Seconds)"
  }
  
  dimension: has_presenter {
    type: yesno
    sql: ${TABLE}.has_presenter ;;
    label: "Has Presenter"
  }
  
  dimension: cta_text {
    type: string
    sql: ${TABLE}.cta_text ;;
    label: "CTA Text"
  }
  
  dimension: creative_theme {
    type: string
    sql: ${TABLE}.creative_theme ;;
    label: "Creative Theme"
  }
  
  dimension: color_scheme {
    type: string
    sql: ${TABLE}.color_scheme ;;
    label: "Color Scheme"
  }
  
  # Format Performance Analysis
  measure: format_performance_score {
    type: average
    sql: 
      CASE 
        WHEN ${format} = 'Video' THEN 3.2
        WHEN ${format} = 'Static' THEN 2.8
        WHEN ${format} = 'GIF' THEN 2.5
        ELSE 2.0
      END ;;
    label: "Format Performance Score"
    value_format: "0.0"
  }
}
