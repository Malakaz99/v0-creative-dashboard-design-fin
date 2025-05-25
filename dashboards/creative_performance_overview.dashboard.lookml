- dashboard: creative_performance_overview
  title: "Isracard - Creative Performance Dashboard | M:ad"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Unified creative intelligence across all digital platforms"
  
  filters:
  - name: date_range
    title: "Date Range"
    type: field_filter
    default_value: "30 days"
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: creative_performance
    explore: creative_performance
    listens_to_filters: []
    field: creative_performance.date_date
    
  - name: platform_filter
    title: "Platform"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: creative_performance
    explore: creative_performance
    listens_to_filters: []
    field: creative_performance.platform_name
    
  - name: product_filter
    title: "Product"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: creative_performance
    explore: creative_performance
    listens_to_filters: []
    field: creative_performance.product_name
    
  - name: funnel_stage_filter
    title: "Funnel Stage"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: creative_performance
    explore: creative_performance
    listens_to_filters: []
    field: creative_performance.funnel_stage

  elements:
  - title: "Total Impressions"
    name: total_impressions
    model: creative_performance
    explore: creative_performance
    type: single_value
    fields: [creative_performance.total_impressions]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: "Total Impressions"
    value_format: "#,##0.0,,\"M\""
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 2
    col: 0
    width: 4
    height: 4

  - title: "Total Clicks"
    name: total_clicks
    model: creative_performance
    explore: creative_performance
    type: single_value
    fields: [creative_performance.total_clicks]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Total Clicks"
    value_format: "#,##0.0,\"K\""
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 2
    col: 4
    width: 4
    height: 4

  - title: "Total Conversions"
    name: total_conversions
    model: creative_performance
    explore: creative_performance
    type: single_value
    fields: [creative_performance.total_conversions]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Total Conversions"
    value_format: "#,##0.0,\"K\""
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 2
    col: 8
    width: 4
    height: 4

  - title: "Total Spend"
    name: total_spend
    model: creative_performance
    explore: creative_performance
    type: single_value
    fields: [creative_performance.total_spend]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Total Spend"
    value_format: "$#,##0.0,\"K\""
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 2
    col: 12
    width: 4
    height: 4

  - title: "Average CTR"
    name: average_ctr
    model: creative_performance
    explore: creative_performance
    type: single_value
    fields: [creative_performance.ctr]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Average CTR"
    value_format: "0.00\%"
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 2
    col: 16
    width: 4
    height: 4

  - title: "Average CVR"
    name: average_cvr
    model: creative_performance
    explore: creative_performance
    type: single_value
    fields: [creative_performance.cvr]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Average CVR"
    value_format: "0.00\%"
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 2
    col: 20
    width: 4
    height: 4

  - title: "Platform Performance Comparison"
    name: platform_comparison
    model: creative_performance
    explore: creative_performance
    type: looker_column
    fields: [creative_performance.platform_name, creative_performance.ctr, creative_performance.cvr, creative_performance.cpa]
    sorts: [creative_performance.ctr desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: isracard-colors
      palette_id: isracard-categorical-0
    series_colors:
      creative_performance.ctr: "#0070BA"
      creative_performance.cvr: "#E91E63"
      creative_performance.cpa: "#000000"
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 6
    col: 0
    width: 12
    height: 8

  - title: "Funnel Stage Performance"
    name: funnel_performance
    model: creative_performance
    explore: creative_performance
    type: looker_line
    fields: [creative_performance.funnel_stage, creative_performance.ctr, creative_performance.cvr, creative_performance.cpa]
    sorts: [creative_performance.funnel_stage]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: isracard-colors
      palette_id: isracard-categorical-0
    series_colors:
      creative_performance.ctr: "#0070BA"
      creative_performance.cvr: "#E91E63"
      creative_performance.cpa: "#000000"
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 6
    col: 12
    width: 12
    height: 8

  - title: "Top Performing Creatives"
    name: top_creatives
    model: creative_performance
    explore: creative_performance
    type: looker_grid
    fields: [creative_performance.creative_id, creative_performance.creative_name, creative_performance.platform_name, 
             creative_performance.product_name, creative_performance.funnel_stage, creative_performance.total_impressions,
             creative_performance.total_clicks, creative_performance.total_conversions, creative_performance.total_spend,
             creative_performance.ctr, creative_performance.cvr, creative_performance.cpa, creative_performance.quality_score]
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
        value: 2.5
        background_color: "#d4edda"
        font_color: "#155724"
        color_application:
          collection_id: isracard-colors
          palette_id: isracard-diverging-0
        bold: false
        italic: false
        strikethrough: false
        fields: [creative_performance.quality_score]
      }
    ]
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 14
    col: 0
    width: 24
    height: 8
