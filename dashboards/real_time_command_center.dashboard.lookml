- dashboard: real_time_command_center
  title: "🚀 Real-Time Campaign Command Center"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Live monitoring and control center for active campaigns with real-time alerts"
  refresh: 2 minutes
  
  filters:
  - name: urgency_filter
    title: "🚨 Alert Level"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: isracard_creative_analytics
    explore: outlier_analysis
    field: outlier_analysis.outlier_type

  elements:
  # Real-Time Status Board
  - title: "🔴 LIVE CAMPAIGNS"
    name: live_campaigns_status
    model: isracard_creative_analytics
    explore: live_campaigns
    type: single_value
    fields: [live_campaigns.live_campaigns_count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "🔴 LIVE CAMPAIGNS"
    value_format: "#,##0"
    font_size: extra_large
    text_color: "#16a34a"
    row: 0
    col: 0
    width: 4
    height: 4

  - title: "💰 LIVE DAILY SPEND"
    name: live_daily_spend
    model: isracard_creative_analytics
    explore: live_campaigns
    type: single_value
    fields: [live_campaigns.total_daily_spend_live]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "💰 LIVE DAILY SPEND"
    value_format: "$#,##0"
    font_size: extra_large
    text_color: "#0070BA"
    row: 0
    col: 4
    width: 4
    height: 4

  - title: "⚠️ CRITICAL ALERTS"
    name: critical_alerts
    model: isracard_creative_analytics
    explore: outlier_analysis
    type: single_value
    fields: [outlier_analysis.total_conversions]
    filters:
      outlier_analysis.is_outlier: "yes"
      outlier_analysis.outlier_type: "underperforming"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "⚠️ CRITICAL ALERTS"
    value_format: "#,##0"
    font_size: extra_large
    text_color: "#dc2626"
    row: 0
    col: 8
    width: 4
    height: 4

  - title: "🏆 TOP PERFORMERS"
    name: top_performers_count
    model: isracard_creative_analytics
    explore: outlier_analysis
    type: single_value
    fields: [outlier_analysis.total_conversions]
    filters:
      outlier_analysis.is_outlier: "yes"
      outlier_analysis.outlier_type: "top_performer"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "🏆 TOP PERFORMERS"
    value_format: "#,##0"
    font_size: extra_large
    text_color: "#F5A623"
    row: 0
    col: 12
    width: 4
    height: 4

  - title: "⚡ HOURLY VELOCITY"
    name: hourly_velocity
    model: isracard_creative_analytics
    explore: creative_performance
    type: single_value
    fields: [creative_performance.ctr]
    filters:
      creative_performance.date_date: "today"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "⚡ HOURLY VELOCITY"
    value_format: "0.00\%"
    font_size: extra_large
    text_color: "#E91E63"
    row: 0
    col: 16
    width: 4
    height: 4

  - title: "🎯 CONVERSION RATE"
    name: live_conversion_rate
    model: isracard_creative_analytics
    explore: creative_performance
    type: single_value
    fields: [creative_performance.cvr]
    filters:
      creative_performance.date_date: "today"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "🎯 CONVERSION RATE"
    value_format: "0.00\%"
    font_size: extra_large
    text_color: "#4A90E2"
    row: 0
    col: 20
    width: 4
    height: 4

  # Real-Time Performance Chart
  - title: "📊 Real-Time Performance Monitor (Last 24 Hours)"
    name: realtime_performance
    model: isracard_creative_analytics
    explore: creative_performance
    type: looker_line
    fields: [creative_performance.date_hour, creative_performance.total_spend, creative_performance.total_conversions, creative_performance.ctr]
    fill_fields: [creative_performance.date_hour]
    filters:
      creative_performance.date_date: "1 days"
    sorts: [creative_performance.date_hour desc]
    limit: 24
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    show_null_points: false
    interpolation: linear
    y_axes: [{label: 'Spend & Conversions', orientation: left, series: [{axisId: creative_performance.total_spend, id: creative_performance.total_spend}, {axisId: creative_performance.total_conversions, id: creative_performance.total_conversions}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {label: 'CTR %', orientation: right, series: [{axisId: creative_performance.ctr, id: creative_performance.ctr}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    series_colors:
      creative_performance.total_spend: "#0070BA"
      creative_performance.total_conversions: "#E91E63"
      creative_performance.ctr: "#000000"
    series_labels:
      creative_performance.total_spend: "Hourly Spend"
      creative_performance.total_conversions: "Hourly Conversions"
      creative_performance.ctr: "Hourly CTR"
    row: 4
    col: 0
    width: 24
    height: 8

  # Critical Alerts Table
  - title: "🚨 CRITICAL PERFORMANCE ALERTS - IMMEDIATE ACTION REQUIRED"
    name: critical_alerts_table
    model: isracard_creative_analytics
    explore: outlier_analysis
    type: looker_grid
    fields: [outlier_analysis.creative_id, outlier_analysis.creative_name, outlier_analysis.platform_name, outlier_analysis.product_name, outlier_analysis.total_spend, outlier_analysis.cpa, outlier_analysis.quality_score, outlier_analysis.variance_from_benchmark]
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
    header_font_size: '14'
    rows_font_size: '12'
    conditional_formatting: [
      {
        type: less than
        value: 2.0
        background_color: "#dc2626"
        font_color: "#ffffff"
        bold: true
        italic: false
        strikethrough: false
        fields: [outlier_analysis.quality_score]
      },
      {
        type: greater than
        value: 10.0
        background_color: "#f59e0b"
        font_color: "#ffffff"
        bold: true
        italic: false
        strikethrough: false
        fields: [outlier_analysis.cpa]
      }
    ]
    listen:
      urgency_filter: outlier_analysis.outlier_type
    row: 12
    col: 0
    width: 24
    height: 8

  # Live Campaign Performance Table
  - title: "🔴 LIVE CAMPAIGN PERFORMANCE MONITOR"
    name: live_campaign_monitor
    model: isracard_creative_analytics
    explore: live_campaigns
    type: looker_grid
    fields: [creative_performance.creative_id, creative_performance.creative_name, platforms.platform_name, creative_performance.product_name, creative_performance.campaign_status, creative_performance.daily_spend, creative_performance.daily_impressions, creative_performance.ctr, creative_performance.cvr, creative_performance.quality_score, live_campaigns.last_updated_time]
    filters:
      live_campaigns.is_live: "yes"
    sorts: [creative_performance.daily_spend desc]
    limit: 20
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
    rows_font_size: '11'
    conditional_formatting: [
      {
        type: greater than
        value: 3.0
        background_color: "#d4edda"
        font_color: "#155724"
        bold: false
        italic: false
        strikethrough: false
        fields: [creative_performance.quality_score]
      },
      {
        type: greater than
        value: 7.0
        background_color: "#d1ecf1"
        font_color: "#0c5460"
        bold: false
        italic: false
        strikethrough: false
        fields: [creative_performance.ctr]
      }
    ]
    row: 20
    col: 0
    width: 24
    height: 10
