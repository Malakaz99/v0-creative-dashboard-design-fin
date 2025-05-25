view: products {
  sql_table_name: `isracard_analytics.products` ;;
  
  dimension: product_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.product_id ;;
    hidden: yes
  }
  
  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
    label: "Product"
  }
  
  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
    label: "Product Category"
  }
  
  dimension: target_audience {
    type: string
    sql: ${TABLE}.target_audience ;;
    label: "Target Audience"
  }
  
  dimension: product_priority {
    type: string
    sql: ${TABLE}.product_priority ;;
    label: "Product Priority"
  }
}
