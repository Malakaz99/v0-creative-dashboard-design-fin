- dashboard: live_campaigns_monitoring
  title: "Live Campaigns - Real-Time Monitoring"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Real-time monitoring of active campaigns"
  refresh: 5 minutes
  
  filters:
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
    explore: live_campaigns
    listens_to_filters: []
    field: platforms.platform_name

  elements:
  - title: "Live Campaigns Status"
    name: live_status
    model: creative_performance
    explore: live_campaigns
    type: single_value
    fields: [live_campaigns.live_campaigns_count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Active Campaigns"
    value_format: "#,##0"
    listen:
      platform_filter: platforms.platform_name
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Total Daily Spend (Live)"
    name: daily_spend_live
    model: creative_performance
    explore: live_campaigns
    type: single_value
    fields: [live_campaigns.total_daily_spend_live]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: "Total Daily Spend"
    value_format: "$#,##0"
    listen:
      platform_filter: platforms.platform_name
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Live Creatives Performance"
    name: live_creatives_table
    model: creative_performance
    explore: live_campaigns
    type: looker_grid
    fields: [creative_performance.creative_id, creative_performance.creative_name, platforms.platform_name,
             creative_performance.product_name, creative_performance.campaign_status, creative_performance.start_date_date,
             creative_performance.daily_spend, creative_performance.daily_impressions, creative_performance.ctr,
             creative_performance.cvr, creative_performance.quality_score]
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
    rows_font_size: '12'
    listen:
      platform_filter: platforms.platform_name
    row: 4
    col: 0
    width: 24
    height: 12
