- dashboard: creative_intelligence
  title: "🧠 Creative Intelligence & Optimization Hub"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Advanced creative analytics with AI-powered insights and optimization recommendations"
  
  filters:
  - name: date_range
    title: "📅 Analysis Period"
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
    
  - name: platform_filter
    title: "📱 Platform"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: isracard_creative_analytics
    explore: creative_performance
    field: creative_performance.platform_name

  elements:
  # Creative Format Performance Deep Dive
  - title: "🎨 Creative Format Performance Analysis"
    name: format_performance_analysis
    model: isracard_creative_analytics
    explore: creative_performance
    type: looker_column
    fields: [creative_attributes.format, creative_performance.total_conversions, creative_performance.ctr, creative_performance.cvr, creative_performance.cpa, creative_attributes.creative_count]
    sorts: [creative_performance.total_conversions desc]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: 'Conversions & Count', orientation: left, series: [{axisId: creative_performance.total_conversions, id: creative_performance.total_conversions}, {axisId: creative_attributes.creative_count, id: creative_attributes.creative_count}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {label: 'Rates (%)', orientation: right, series: [{axisId: creative_performance.ctr, id: creative_performance.ctr}, {axisId: creative_performance.cvr, id: creative_performance.cvr}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    series_types:
      creative_performance.ctr: line
      creative_performance.cvr: line
    series_colors:
      creative_performance.total_conversions: "#0070BA"
      creative_attributes.creative_count: "#E91E63"
      creative_performance.ctr: "#000000"
      creative_performance.cvr: "#4A90E2"
    series_labels:
      creative_performance.total_conversions: "Total Conversions"
      creative_attributes.creative_count: "Creative Count"
      creative_performance.ctr: "CTR %"
      creative_performance.cvr: "CVR %"
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
    row: 0
    col: 0
    width: 12
    height: 8

  # Video Length Optimization
  - title: "🎬 Video Length Optimization Matrix"
    name: video_length_optimization
    model: isracard_creative_analytics
    explore: creative_performance
    type: looker_scatter
    fields: [creative_attributes.video_length, creative_performance.ctr, creative_performance.cvr, creative_performance.total_conversions, creative_performance.cpa]
    filters:
      creative_attributes.format: "Video"
    sorts: [creative_performance.total_conversions desc]
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
    plot_size_by_field: creative_performance.total_conversions
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
    size_by_field: creative_performance.total_conversions
    series_colors:
      "15s": "#0070BA"
      "30s": "#E91E63"
      "45s": "#000000"
      "60s+": "#4A90E2"
    x_axis_label: "Click-Through Rate (%)"
    y_axis_label: "Conversion Rate (%)"
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
    row: 0
    col: 12
    width: 12
    height: 8

  # Creative Attribute Performance Heatmap
  - title: "🔥 Creative Attribute Performance Heatmap"
    name: attribute_heatmap
    model: isracard_creative_analytics
    explore: creative_performance
    type: looker_grid
    fields: [creative_attributes.format, creative_attributes.has_presenter, creative_attributes.video_length, creative_performance.total_conversions, creative_performance.ctr, creative_performance.cvr, creative_performance.cpa, creative_performance.quality_score]
    pivots: [creative_attributes.has_presenter]
    sorts: [creative_performance.total_conversions desc 0, creative_attributes.has_presenter]
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
    header_font_size: '12'
    rows_font_size: '11'
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
        background_color: "#fff3cd"
        font_color: 
        color_application:
          collection_id: isracard-colors
          palette_id: isracard-sequential-0
        bold: false
        italic: false
        strikethrough: false
        fields: [creative_performance.ctr, creative_performance.cvr]
      }
    ]
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
    row: 8
    col: 0
    width: 24
    height: 8

  # Audience Segment Performance
  - title: "👥 Audience Segment Performance Analysis"
    name: audience_performance
    model: isracard_creative_analytics
    explore: creative_performance
    type: looker_column
    fields: [creative_performance.audience_type, creative_performance.total_conversions, creative_performance.ctr, creative_performance.cpa, audience_segments.total_audience_size]
    sorts: [creative_performance.total_conversions desc]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: 'Conversions & Audience Size', orientation: left, series: [{axisId: creative_performance.total_conversions, id: creative_performance.total_conversions}, {axisId: audience_segments.total_audience_size, id: audience_segments.total_audience_size}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {label: 'CTR & CPA', orientation: right, series: [{axisId: creative_performance.ctr, id: creative_performance.ctr}, {axisId: creative_performance.cpa, id: creative_performance.cpa}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    series_types:
      creative_performance.ctr: line
      creative_performance.cpa: line
    series_colors:
      creative_performance.total_conversions: "#0070BA"
      audience_segments.total_audience_size: "#E91E63"
      creative_performance.ctr: "#000000"
      creative_performance.cpa: "#4A90E2"
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
    row: 16
    col: 0
    width: 12
    height: 8

  # Device Performance Breakdown
  - title: "📱 Device Performance Breakdown"
    name: device_performance_breakdown
    model: isracard_creative_analytics
    explore: creative_performance
    type: looker_pie
    fields: [creative_performance.device_type, creative_performance.total_conversions]
    sorts: [creative_performance.total_conversions desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    start_angle: 90
    series_colors:
      Mobile: "#0070BA"
      Desktop: "#E91E63"
      Tablet: "#000000"
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
    row: 16
    col: 12
    width: 6
    height: 8

  # Placement Performance
  - title: "📍 Placement Performance Analysis"
    name: placement_performance
    model: isracard_creative_analytics
    explore: creative_performance
    type: looker_bar
    fields: [creative_performance.placement, creative_performance.total_conversions, creative_performance.ctr, creative_performance.cpa]
    sorts: [creative_performance.total_conversions desc]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: 'Conversions', orientation: bottom, series: [{axisId: creative_performance.total_conversions, id: creative_performance.total_conversions}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {label: 'CTR & CPA', orientation: top, series: [{axisId: creative_performance.ctr, id: creative_performance.ctr}, {axisId: creative_performance.cpa, id: creative_performance.cpa}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    series_types:
      creative_performance.ctr: line
      creative_performance.cpa: line
    series_colors:
      creative_performance.total_conversions: "#0070BA"
      creative_performance.ctr: "#E91E63"
      creative_performance.cpa: "#000000"
    listen:
      date_range: creative_performance.date_date
      platform_filter: creative_performance.platform_name
    row: 16
    col: 18
    width: 6
    height: 8
