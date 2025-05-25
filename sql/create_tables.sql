-- Create the main creative performance table
CREATE TABLE `isracard_analytics.creative_performance` (
  creative_performance_id STRING,
  creative_id STRING,
  creative_name STRING,
  creative_image_url STRING,
  platform_id STRING,
  platform_name STRING,
  campaign_id STRING,
  campaign_name STRING,
  campaign_status STRING,
  product_id STRING,
  product_name STRING,
  audience_id STRING,
  audience_type STRING,
  funnel_stage STRING,
  device_type STRING,
  placement STRING,
  date DATE,
  start_date DATE,
  impressions INT64,
  clicks INT64,
  conversions INT64,
  spend FLOAT64,
  views INT64,
  quality_score FLOAT64,
  daily_spend FLOAT64,
  daily_impressions INT64,
  is_outlier BOOL,
  outlier_type STRING,
  variance_from_benchmark STRING
);

-- Create creative attributes table
CREATE TABLE `isracard_analytics.creative_attributes` (
  creative_id STRING,
  format STRING,
  video_length STRING,
  has_presenter BOOL,
  cta_text STRING,
  creative_theme STRING,
  color_scheme STRING
);

-- Create platforms table
CREATE TABLE `isracard_analytics.platforms` (
  platform_id STRING,
  platform_name STRING,
  platform_category STRING
);

-- Create products table
CREATE TABLE `isracard_analytics.products` (
  product_id STRING,
  product_name STRING,
  product_category STRING,
  target_audience STRING,
  product_priority STRING
);

-- Create live campaigns table
CREATE TABLE `isracard_analytics.live_campaigns` (
  campaign_id STRING,
  creative_id STRING,
  platform_id STRING,
  is_live BOOL,
  last_updated TIMESTAMP,
  daily_spend FLOAT64
);

-- Create audience segments table
CREATE TABLE `isracard_analytics.audience_segments` (
  audience_id STRING,
  audience_name STRING,
  audience_type STRING,
  audience_size INT64,
  demographic_profile STRING
);
