- dashboard: creative_performance_overview
  title: "Isracard Creative Performance Dashboard | M:ad"
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
    model: isracard_creative_analytics
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
    model: isracard_creative_analytics
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
    model: isracard_creative_analytics
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
    model: isracard_creative_analytics
    explore: creative_performance
    listens_to_filters: []
    field: creative_performance.funnel_stage

  elements:
  - title: "Total Impressions"
    name: total_impressions
    model: isracard_creative_analytics
    explore: creative_performance
    type: single_value
    fields: [creative_performance.total_impressions]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    single_value_title: "Total Impressions"
    value_format: "#,##0.0,,\"M\""
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 0
    col: 0
    width: 4
    height: 4

  - title: "Total Clicks"
    name: total_clicks
    model: isracard_creative_analytics
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
    row: 0
    col: 4
    width: 4
    height: 4

  - title: "Total Conversions"
    name: total_conversions
    model: isracard_creative_analytics
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
    row: 0
    col: 8
    width: 4
    height: 4

  - title: "Total Spend"
    name: total_spend
    model: isracard_creative_analytics
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
    row: 0
    col: 12
    width: 4
    height: 4

  - title: "Average CTR"
    name: average_ctr
    model: isracard_creative_analytics
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
    row: 0
    col: 16
    width: 4
    height: 4

  - title: "Average CPA"
    name: average_cpa
    model: isracard_creative_analytics
    explore: creative_performance
    type: single_value
    fields: [creative_performance.cpa]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Average CPA"
    value_format: "$0.00"
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 0
    col: 20
    width: 4
    height: 4

  - title: "Platform Performance Comparison"
    name: platform_comparison
    model: isracard_creative_analytics
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
    series_colors:
      creative_performance.ctr: "#0070BA"
      creative_performance.cvr: "#E91E63"
      creative_performance.cpa: "#000000"
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 4
    col: 0
    width: 12
    height: 8

  - title: "Funnel Stage Performance"
    name: funnel_performance
    model: isracard_creative_analytics
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
    series_colors:
      creative_performance.ctr: "#0070BA"
      creative_performance.cvr: "#E91E63"
      creative_performance.cpa: "#000000"
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 4
    col: 12
    width: 12
    height: 8

  - title: "Top Performing Creatives"
    name: top_creatives
    model: isracard_creative_analytics
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
    row: 12
    col: 0
    width: 24
    height: 8

  - title: "Live Campaigns Status"
    name: live_campaigns_status
    model: isracard_creative_analytics
    explore: live_campaigns
    type: single_value
    fields: [live_campaigns.live_campaigns_count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Live Campaigns"
    value_format: "#,##0"
    row: 20
    col: 0
    width: 6
    height: 4

  - title: "Daily Spend (Live)"
    name: daily_spend_live
    model: isracard_creative_analytics
    explore: live_campaigns
    type: single_value
    fields: [live_campaigns.total_daily_spend_live]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Daily Spend (Live)"
    value_format: "$#,##0"
    row: 20
    col: 6
    width: 6
    height: 4

  - title: "Creative Format Distribution"
    name: format_distribution
    model: isracard_creative_analytics
    explore: creative_performance
    type: looker_pie
    fields: [creative_attributes.format, creative_performance.total_conversions]
    sorts: [creative_performance.total_conversions desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    inner_radius: 40
    series_colors:
      Video: "#0070BA"
      Static: "#E91E63"
      GIF: "#000000"
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 20
    col: 12
    width: 12
    height: 8

  - title: "Performance Trends Over Time"
    name: performance_trends
    model: isracard_creative_analytics
    explore: creative_performance
    type: looker_line
    fields: [creative_performance.date_date, creative_performance.ctr, creative_performance.cvr, creative_performance.cpa]
    fill_fields: [creative_performance.date_date]
    sorts: [creative_performance.date_date desc]
    limit: 30
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
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
    show_null_points: true
    interpolation: linear
    series_colors:
      creative_performance.ctr: "#0070BA"
      creative_performance.cvr: "#E91E63"
      creative_performance.cpa: "#000000"
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
      product_filter: creative_performance.product_name
      funnel_stage_filter: creative_performance.funnel_stage
    row: 28
    col: 0
    width: 24
    height: 8
