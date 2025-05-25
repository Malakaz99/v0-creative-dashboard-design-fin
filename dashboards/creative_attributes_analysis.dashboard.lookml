- dashboard: creative_attributes_analysis
  title: "Creative Attributes Performance Analysis"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Analysis of creative performance by format, length, and other attributes"
  
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
    model: isracard_creative_analytics
    explore: creative_attributes_analysis
    listens_to_filters: []
    field: creative_attributes_analysis.date_date

  elements:
  - title: "Format Performance Distribution"
    name: format_distribution
    model: isracard_creative_analytics
    explore: creative_attributes_analysis
    type: looker_pie
    fields: [creative_attributes.format, creative_attributes_analysis.total_conversions]
    sorts: [creative_attributes_analysis.total_conversions desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    inner_radius: 40
    series_colors:
      Video: "#0070BA"
      Static: "#E91E63"
      GIF: "#000000"
    listen:
      date_range: creative_attributes_analysis.date_date
    row: 0
    col: 0
    width: 8
    height: 8

  - title: "Video Length Performance"
    name: video_length_performance
    model: isracard_creative_analytics
    explore: creative_attributes_analysis
    type: looker_column
    fields: [creative_attributes.video_length, creative_attributes_analysis.total_conversions, creative_attributes_analysis.ctr, creative_attributes_analysis.cpa]
    filters:
      creative_attributes.format: "Video"
    sorts: [creative_attributes.video_length_seconds]
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
    series_colors:
      creative_attributes_analysis.total_conversions: "#0070BA"
      creative_attributes_analysis.ctr: "#E91E63"
      creative_attributes_analysis.cpa: "#000000"
    listen:
      date_range: creative_attributes_analysis.date_date
    row: 0
    col: 8
    width: 8
    height: 8

  - title: "Product Performance Analysis"
    name: product_performance
    model: isracard_creative_analytics
    explore: creative_attributes_analysis
    type: looker_grid
    fields: [creative_attributes_analysis.product_name, creative_attributes_analysis.total_conversions, creative_attributes_analysis.ctr,
             creative_attributes_analysis.cvr, creative_attributes_analysis.cpa, creative_attributes_analysis.quality_score]
    sorts: [creative_attributes_analysis.total_conversions desc]
    limit: 500
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
      date_range: creative_attributes_analysis.date_date
    row: 0
    col: 16
    width: 8
    height: 8

  - title: "Device Performance Comparison"
    name: device_performance
    model: isracard_creative_analytics
    explore: creative_attributes_analysis
    type: looker_column
    fields: [creative_attributes_analysis.device_type, creative_attributes_analysis.total_conversions, creative_attributes_analysis.ctr, creative_attributes_analysis.cvr]
    sorts: [creative_attributes_analysis.total_conversions desc]
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
      creative_attributes_analysis.total_conversions: "#0070BA"
      creative_attributes_analysis.ctr: "#E91E63"
      creative_attributes_analysis.cvr: "#000000"
    listen:
      date_range: creative_attributes_analysis.date_date
    row: 8
    col: 0
    width: 24
    height: 8

  - title: "Creative Attributes Summary"
    name: attributes_summary
    model: isracard_creative_analytics
    explore: creative_attributes_analysis
    type: looker_grid
    fields: [creative_attributes.format, creative_attributes.creative_count, creative_attributes.format_performance_score,
             creative_attributes_analysis.total_conversions, creative_attributes_analysis.ctr, creative_attributes_analysis.cpa]
    sorts: [creative_attributes_analysis.total_conversions desc]
    limit: 500
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
      date_range: creative_attributes_analysis.date_date
    row: 16
    col: 0
    width: 24
    height: 6
