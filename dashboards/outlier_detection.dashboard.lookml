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
    explore: outlier_analysis
    listens_to_filters: []
    field: outlier_analysis.date_date

  elements:
  - title: "Underperforming Creatives Alert"
    name: underperforming_alert
    model: creative_performance
    explore: outlier_analysis
    type: single_value
    fields: [outlier_analysis.total_conversions]
    filters:
      outlier_analysis.is_outlier: "yes"
      outlier_analysis.outlier_type: "underperforming"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Underperforming Creatives"
    value_format: "#,##0"
    listen:
      date_range: outlier_analysis.date_date
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Top Performers Count"
    name: top_performers_count
    model: creative_performance
    explore: outlier_analysis
    type: single_value
    fields: [outlier_analysis.total_conversions]
    filters:
      outlier_analysis.is_outlier: "yes"
      outlier_analysis.outlier_type: "top_performer"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Top Performers"
    value_format: "#,##0"
    listen:
      date_range: outlier_analysis.date_date
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Underperforming Creatives"
    name: underperforming_creatives
    model: creative_performance
    explore: outlier_analysis
    type: looker_grid
    fields: [outlier_analysis.creative_id, outlier_analysis.creative_name, outlier_analysis.platform_name,
             outlier_analysis.product_name, outlier_analysis.outlier_type, outlier_analysis.variance_from_benchmark,
             outlier_analysis.total_spend, outlier_analysis.cpa, outlier_analysis.quality_score]
    filters:
      outlier_analysis.is_outlier: "yes"
      outlier_analysis.outlier_type: "underperforming"
    sorts: [outlier_analysis.total_spend desc]
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
        fields: [outlier_analysis.quality_score]
      }
    ]
    listen:
      date_range: outlier_analysis.date_date
    row: 4
    col: 0
    width: 12
    height: 8

  - title: "Top Performing Creatives"
    name: top_performing_creatives
    model: creative_performance
    explore: outlier_analysis
    type: looker_grid
    fields: [outlier_analysis.creative_id, outlier_analysis.creative_name, outlier_analysis.platform_name,
             outlier_analysis.product_name, outlier_analysis.variance_from_benchmark,
             outlier_analysis.total_spend, outlier_analysis.cpa, outlier_analysis.quality_score]
    filters:
      outlier_analysis.is_outlier: "yes"
      outlier_analysis.outlier_type: "top_performer"
    sorts: [outlier_analysis.quality_score desc]
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
        fields: [outlier_analysis.quality_score]
      }
    ]
    listen:
      date_range: outlier_analysis.date_date
    row: 4
    col: 12
    width: 12
    height: 8
