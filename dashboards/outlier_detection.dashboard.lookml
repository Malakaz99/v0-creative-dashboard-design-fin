- dashboard: outlier_detection
  title: "Creative Performance - Outlier Detection"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Automated detection of underperforming and top performing creatives"
  
  filters:
  - name: date_range
    title: "Date Range"
    type: field_filter
    default_value: "7 days"
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: creative_performance
    explore: creative_performance
    listens_to_filters: []
    field: creative_performance.date_date

  elements:
  - title: "Underperforming Creatives"
    name: underperforming_creatives
    model: creative_performance
    explore: creative_performance
    type: looker_grid
    fields: [creative_performance.creative_id, creative_performance.creative_name, creative_performance.platform_name,
             creative_performance.product_name, creative_performance.outlier_type, creative_performance.variance_from_benchmark,
             creative_performance.total_spend, creative_performance.cpa, creative_performance.quality_score]
    filters:
      creative_performance.is_outlier: "yes"
      creative_performance.outlier_type: "underperforming"
    sorts: [creative_performance.total_spend desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [
      {
        type: less than
        value: 2.0
        background_color: "#f8d7da"
        font_color: "#721c24"
        color_application:
          collection_id: isracard-colors
        bold: false
        italic: false
        strikethrough: false
        fields: [creative_performance.quality_score]
      }
    ]
    listen:
      date_range: creative_performance.date_date
    row: 2
    col: 0
    width: 12
    height: 8

  - title: "Top Performing Creatives"
    name: top_performing_creatives
    model: creative_performance
    explore: creative_performance
    type: looker_grid
    fields: [creative_performance.creative_id, creative_performance.creative_name, creative_performance.platform_name,
             creative_performance.product_name, creative_performance.variance_from_benchmark,
             creative_performance.total_spend, creative_performance.cpa, creative_performance.quality_score]
    filters:
      creative_performance.is_outlier: "yes"
      creative_performance.outlier_type: "top_performer"
    sorts: [creative_performance.quality_score desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [
      {
        type: greater than
        value: 3.0
        background_color: "#d4edda"
        font_color: "#155724"
        color_application:
          collection_id: isracard-colors
        bold: false
        italic: false
        strikethrough: false
        fields: [creative_performance.quality_score]
      }
    ]
    listen:
      date_range: creative_performance.date_date
    row: 2
    col: 12
    width: 12
    height: 8
