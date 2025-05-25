- dashboard: executive_overview
  title: "🎯 Isracard Creative Performance - Executive Overview"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Executive-level insights into creative performance across all channels"
  
  filters:
  - name: date_range
    title: "📅 Date Range"
    type: field_filter
    default_value: "30 days"
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: isracard_creative_analytics
    explore: creative_performance
    field: creative_performance.date_date
    
  - name: product_filter
    title: "🏦 Product Line"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: isracard_creative_analytics
    explore: creative_performance
    field: creative_performance.product_name

  elements:
  # Executive KPI Row
  - title: "💰 Total Media Investment"
    name: total_investment
    model: isracard_creative_analytics
    explore: creative_performance
    type: single_value
    fields: [creative_performance.total_spend]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Total Media Investment"
    value_format: "$#,##0,\"K\""
    font_size: large
    text_color: "#0070BA"
    listen:
      date_range: creative_performance.date_date
      product_filter: creative_performance.product_name
    row: 0
    col: 0
    width: 4
    height: 3

  - title: "🎯 Total Conversions"
    name: total_conversions_exec
    model: isracard_creative_analytics
    explore: creative_performance
    type: single_value
    fields: [creative_performance.total_conversions]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Total Conversions"
    value_format: "#,##0"
    font_size: large
    text_color: "#E91E63"
    listen:
      date_range: creative_performance.date_date
      product_filter: creative_performance.product_name
    row: 0
    col: 4
    width: 4
    height: 3

  - title: "📊 Blended CPA"
    name: blended_cpa
    model: isracard_creative_analytics
    explore: creative_performance
    type: single_value
    fields: [creative_performance.cpa]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Blended CPA"
    value_format: "$0.00"
    font_size: large
    text_color: "#000000"
    listen:
      date_range: creative_performance.date_date
      product_filter: creative_performance.product_name
    row: 0
    col: 8
    width: 4
    height: 3

  - title: "⚡ Campaign Velocity"
    name: campaign_velocity
    model: isracard_creative_analytics
    explore: creative_performance
    type: single_value
    fields: [creative_performance.ctr]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Average CTR"
    value_format: "0.00\%"
    font_size: large
    text_color: "#4A90E2"
    listen:
      date_range: creative_performance.date_date
      product_filter: creative_performance.product_name
    row: 0
    col: 12
    width: 4
    height: 3

  - title: "🏆 Quality Score"
    name: avg_quality_score
    model: isracard_creative_analytics
    explore: creative_performance
    type: single_value
    fields: [creative_performance.quality_score]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Avg Quality Score"
    value_format: "0.00"
    font_size: large
    text_color: "#F5A623"
    listen:
      date_range: creative_performance.date_date
      product_filter: creative_performance.product_name
    row: 0
    col: 16
    width: 4
    height: 3

  - title: "🔴 Live Campaigns"
    name: live_campaigns_count
    model: isracard_creative_analytics
    explore: live_campaigns
    type: single_value
    fields: [live_campaigns.live_campaigns_count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Live Campaigns"
    value_format: "#,##0"
    font_size: large
    text_color: "#16a34a"
    row: 0
    col: 20
    width: 4
    height: 3

  # Performance Trends
  - title: "📈 Performance Trends - Last 30 Days"
    name: performance_trends_executive
    model: isracard_creative_analytics
    explore: creative_performance
    type: looker_line
    fields: [creative_performance.date_date, creative_performance.total_spend, creative_performance.total_conversions, creative_performance.cpa]
    fill_fields: [creative_performance.date_date]
    sorts: [creative_performance.date_date desc]
    limit: 30
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    show_null_points: false
    interpolation: linear
    y_axes: [{label: 'Spend & Conversions', orientation: left, series: [{axisId: creative_performance.total_spend, id: creative_performance.total_spend}, {axisId: creative_performance.total_conversions, id: creative_performance.total_conversions}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {label: 'CPA', orientation: right, series: [{axisId: creative_performance.cpa, id: creative_performance.cpa}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    series_colors:
      creative_performance.total_spend: "#0070BA"
      creative_performance.total_conversions: "#E91E63"
      creative_performance.cpa: "#000000"
    series_labels:
      creative_performance.total_spend: "Daily Spend"
      creative_performance.total_conversions: "Daily Conversions"
      creative_performance.cpa: "Daily CPA"
    listen:
      date_range: creative_performance.date_date
      product_filter: creative_performance.product_name
    row: 3
    col: 0
    width: 24
    height: 8

  # Platform Performance Matrix
  - title: "🌐 Platform Performance Matrix"
    name: platform_matrix
    model: isracard_creative_analytics
    explore: creative_performance
    type: looker_scatter
    fields: [creative_performance.platform_name, creative_performance.ctr, creative_performance.cvr, creative_performance.total_spend]
    sorts: [creative_performance.total_spend desc]
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
    plot_size_by_field: creative_performance.total_spend
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    size_by_field: creative_performance.total_spend
    series_colors:
      Facebook: "#1877F2"
      YouTube: "#FF0000"
      DV360: "#4285F4"
    x_axis_label: "Click-Through Rate (%)"
    y_axis_label: "Conversion Rate (%)"
    listen:
      date_range: creative_performance.date_date
      product_filter: creative_performance.product_name
    row: 11
    col: 0
    width: 12
    height: 8

  # Product Performance Heatmap
  - title: "🏦 Product Line Performance Heatmap"
    name: product_heatmap
    model: isracard_creative_analytics
    explore: creative_performance
    type: looker_grid
    fields: [creative_performance.product_name, creative_performance.total_spend, creative_performance.total_conversions, creative_performance.ctr, creative_performance.cvr, creative_performance.cpa, creative_performance.quality_score]
    sorts: [creative_performance.total_spend desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '12'
    conditional_formatting: [
      {
        type: along a scale...
        value: 
        background_color: "#d4edda"
        font_color: 
        color_application:
          collection_id: isracard-colors
          palette_id: isracard-sequential-0
        bold: false
        italic: false
        strikethrough: false
        fields: [creative_performance.quality_score]
      },
      {
        type: along a scale...
        value: 
        background_color: "#f8d7da"
        font_color: 
        color_application:
          collection_id: isracard-colors
          palette_id: isracard-diverging-0
        bold: false
        italic: false
        strikethrough: false
        fields: [creative_performance.cpa]
      }
    ]
    listen:
      date_range: creative_performance.date_date
      product_filter: creative_performance.product_name
    row: 11
    col: 12
    width: 12
    height: 8

  # Creative Efficiency Analysis
  - title: "⚡ Creative Efficiency Quadrant Analysis"
    name: efficiency_quadrant
    model: isracard_creative_analytics
    explore: creative_performance
    type: looker_scatter
    fields: [creative_performance.creative_name, creative_performance.quality_score, creative_performance.total_spend, creative_performance.total_conversions, creative_performance.platform_name]
    sorts: [creative_performance.total_conversions desc]
    limit: 50
    x_axis_gridlines: true
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
    plot_size_by_field: creative_performance.total_conversions
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
    size_by_field: creative_performance.total_conversions
    series_colors:
      Facebook: "#0070BA"
      YouTube: "#E91E63"
      DV360: "#000000"
    x_axis_label: "Total Spend ($)"
    y_axis_label: "Quality Score"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000", label: "Avg Quality Score"}, {reference_type: line, line_value: mean, range_start: max, range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000", label: "Avg Spend"}]
    listen:
      date_range: creative_performance.date_date
      product_filter: creative_performance.product_name
    row: 19
    col: 0
    width: 24
    height: 10
