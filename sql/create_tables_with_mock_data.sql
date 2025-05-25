-- Create and populate the main creative performance table with mock data
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
  variance_from_benchmark STRING,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

-- Insert mock creative performance data
INSERT INTO `isracard_analytics.creative_performance` VALUES
-- Loans Product - High Performers
('cp001', 'CR001', 'creative_loans_may25_video_30s', '/placeholder.svg?height=60&width=100', 'fb', 'Facebook', 'camp001', 'Loans Q2 2024 - Awareness', 'Active', 'loans', 'Loans', 'aud001', 'Prospecting', 'Awareness', 'Mobile', 'Feed', '2024-05-25', '2024-05-15', 1250000, 85000, 1200, 8500.00, 950000, 3.15, 850.00, 125000, false, null, null, CURRENT_TIMESTAMP()),
('cp002', 'CR002', 'loans_presenter_desktop_45s', '/placeholder.svg?height=60&width=100', 'yt', 'YouTube', 'camp001', 'Loans Q2 2024 - Awareness', 'Active', 'loans', 'Loans', 'aud002', 'Remarketing', 'Mid', 'Desktop', 'In-stream', '2024-05-25', '2024-05-15', 890000, 62000, 980, 6200.00, 720000, 3.28, 620.00, 89000, false, null, null, CURRENT_TIMESTAMP()),
('cp003', 'CR003', 'loans_static_mobile_cta', '/placeholder.svg?height=60&width=100', 'dv360', 'DV360', 'camp001', 'Loans Q2 2024 - Awareness', 'Live', 'loans', 'Loans', 'aud003', 'Lookalike', 'Conversion', 'Mobile', 'Native', '2024-05-25', '2024-05-18', 750000, 52500, 875, 5250.00, null, 2.95, 525.00, 75000, false, null, null, CURRENT_TIMESTAMP()),

-- Credit Cards Product - Top Performers
('cp004', 'CR004', 'cashback_bof_presenter_15s', '/placeholder.svg?height=60&width=100', 'fb', 'Facebook', 'camp002', 'Cashback Spring Campaign', 'Active', 'creditcards', 'Credit Cards', 'aud001', 'Prospecting', 'Conversion', 'Mobile', 'Stories', '2024-05-25', '2024-05-12', 2100000, 147000, 2205, 14700.00, 1680000, 3.45, 1470.00, 210000, false, 'top_performer', '+35%', CURRENT_TIMESTAMP()),
('cp005', 'CR005', 'creditcard_benefits_video_30s', '/placeholder.svg?height=60&width=100', 'yt', 'YouTube', 'camp002', 'Cashback Spring Campaign', 'Active', 'creditcards', 'Credit Cards', 'aud002', 'Remarketing', 'Mid', 'Desktop', 'In-stream', '2024-05-25', '2024-05-12', 1850000, 129500, 1943, 12950.00, 1480000, 3.12, 1295.00, 185000, false, null, null, CURRENT_TIMESTAMP()),

-- Benefits Product - Mixed Performance
('cp006', 'CR006', 'benefits_static_no_presenter', '/placeholder.svg?height=60&width=100', 'dv360', 'DV360', 'camp003', 'Benefits Awareness Q2', 'Active', 'benefits', 'Benefits', 'aud003', 'Lookalike', 'Awareness', 'Mobile', 'Native', '2024-05-25', '2024-05-20', 1200000, 72000, 900, 7200.00, null, 2.45, 720.00, 120000, false, null, null, CURRENT_TIMESTAMP()),
('cp007', 'CR007', 'benefits_gif_presenter_desktop', '/placeholder.svg?height=60&width=100', 'fb', 'Facebook', 'camp003', 'Benefits Awareness Q2', 'Live', 'benefits', 'Benefits', 'aud001', 'Prospecting', 'Mid', 'Desktop', 'Feed', '2024-05-25', '2024-05-20', 980000, 58800, 735, 5880.00, null, 2.65, 588.00, 98000, false, null, null, CURRENT_TIMESTAMP()),

-- B2B Product - Underperformers
('cp008', 'CR008', 'b2b_corporate_video_60s', '/placeholder.svg?height=60&width=100', 'yt', 'YouTube', 'camp004', 'B2B Corporate Solutions', 'Active', 'b2b', 'B2B', 'aud004', 'Prospecting', 'Awareness', 'Desktop', 'In-stream', '2024-05-25', '2024-05-22', 650000, 32500, 390, 3900.00, 520000, 1.85, 390.00, 65000, true, 'underperforming', '-45%', CURRENT_TIMESTAMP()),
('cp009', 'CR009', 'b2b_static_no_presenter_mobile', '/placeholder.svg?height=60&width=100', 'dv360', 'DV360', 'camp004', 'B2B Corporate Solutions', 'Active', 'b2b', 'B2B', 'aud004', 'Prospecting', 'Mid', 'Mobile', 'Native', '2024-05-25', '2024-05-22', 450000, 22500, 270, 2700.00, null, 1.95, 270.00, 45000, true, 'underperforming', '-38%', CURRENT_TIMESTAMP()),

-- More Loans variations
('cp010', 'CR010', 'loans_gif_remarketing_mobile', '/placeholder.svg?height=60&width=100', 'fb', 'Facebook', 'camp005', 'Loans Remarketing Campaign', 'Live', 'loans', 'Loans', 'aud002', 'Remarketing', 'Conversion', 'Mobile', 'Stories', '2024-05-25', '2024-05-23', 1100000, 77000, 1155, 7700.00, null, 3.28, 770.00, 110000, false, null, null, CURRENT_TIMESTAMP()),
('cp011', 'CR011', 'loans_presenter_static_desktop', '/placeholder.svg?height=60&width=100', 'dv360', 'DV360', 'camp005', 'Loans Remarketing Campaign', 'Active', 'loans', 'Loans', 'aud003', 'Lookalike', 'Mid', 'Desktop', 'Native', '2024-05-25', '2024-05-23', 820000, 57400, 861, 5740.00, null, 2.85, 574.00, 82000, false, null, null, CURRENT_TIMESTAMP()),

-- Credit Cards variations
('cp012', 'CR012', 'creditcard_cashback_video_15s', '/placeholder.svg?height=60&width=100', 'yt', 'YouTube', 'camp006', 'Credit Card Cashback Promo', 'Active', 'creditcards', 'Credit Cards', 'aud001', 'Prospecting', 'Awareness', 'Mobile', 'In-stream', '2024-05-25', '2024-05-20', 1650000, 115500, 1732, 11550.00, 1320000, 3.35, 1155.00, 165000, false, 'top_performer', '+28%', CURRENT_TIMESTAMP()),
('cp013', 'CR013', 'creditcard_benefits_static_mobile', '/placeholder.svg?height=60&width=100', 'fb', 'Facebook', 'camp006', 'Credit Card Cashback Promo', 'Live', 'creditcards', 'Credit Cards', 'aud002', 'Remarketing', 'Conversion', 'Mobile', 'Feed', '2024-05-25', '2024-05-20', 1420000, 99400, 1491, 9940.00, null, 3.05, 994.00, 142000, false, null, null, CURRENT_TIMESTAMP()),

-- Benefits variations
('cp014', 'CR014', 'benefits_video_presenter_30s', '/placeholder.svg?height=60&width=100', 'yt', 'YouTube', 'camp007', 'Employee Benefits Campaign', 'Active', 'benefits', 'Benefits', 'aud003', 'Lookalike', 'Awareness', 'Desktop', 'In-stream', '2024-05-25', '2024-05-18', 1050000, 63000, 788, 6300.00, 840000, 2.75, 630.00, 105000, false, null, null, CURRENT_TIMESTAMP()),
('cp015', 'CR015', 'benefits_static_cta_mobile', '/placeholder.svg?height=60&width=100', 'dv360', 'DV360', 'camp007', 'Employee Benefits Campaign', 'Live', 'benefits', 'Benefits', 'aud001', 'Prospecting', 'Mid', 'Mobile', 'Native', '2024-05-25', '2024-05-18', 890000, 53400, 668, 5340.00, null, 2.55, 534.00, 89000, false, null, null, CURRENT_TIMESTAMP()),

-- Historical data for trends (last 30 days)
('cp016', 'CR001', 'creative_loans_may25_video_30s', '/placeholder.svg?height=60&width=100', 'fb', 'Facebook', 'camp001', 'Loans Q2 2024 - Awareness', 'Active', 'loans', 'Loans', 'aud001', 'Prospecting', 'Awareness', 'Mobile', 'Feed', '2024-05-24', '2024-05-15', 1180000, 82600, 1130, 8260.00, 920000, 3.05, 826.00, 118000, false, null, null, CURRENT_TIMESTAMP()),
('cp017', 'CR001', 'creative_loans_may25_video_30s', '/placeholder.svg?height=60&width=100', 'fb', 'Facebook', 'camp001', 'Loans Q2 2024 - Awareness', 'Active', 'loans', 'Loans', 'aud001', 'Prospecting', 'Awareness', 'Mobile', 'Feed', '2024-05-23', '2024-05-15', 1150000, 80500, 1105, 8050.00, 900000, 2.95, 805.00, 115000, false, null, null, CURRENT_TIMESTAMP()),
('cp018', 'CR001', 'creative_loans_may25_video_30s', '/placeholder.svg?height=60&width=100', 'fb', 'Facebook', 'camp001', 'Loans Q2 2024 - Awareness', 'Active', 'loans', 'Loans', 'aud001', 'Prospecting', 'Awareness', 'Mobile', 'Feed', '2024-05-22', '2024-05-15', 1120000, 78400, 1078, 7840.00, 880000, 2.85, 784.00, 112000, false, null, null, CURRENT_TIMESTAMP()),
('cp019', 'CR001', 'creative_loans_may25_video_30s', '/placeholder.svg?height=60&width=100', 'fb', 'Facebook', 'camp001', 'Loans Q2 2024 - Awareness', 'Active', 'loans', 'Loans', 'aud001', 'Prospecting', 'Awareness', 'Mobile', 'Feed', '2024-05-21', '2024-05-15', 1090000, 76300, 1049, 7630.00, 860000, 2.75, 763.00, 109000, false, null, null, CURRENT_TIMESTAMP()),
('cp020', 'CR001', 'creative_loans_may25_video_30s', '/placeholder.svg?height=60&width=100', 'fb', 'Facebook', 'camp001', 'Loans Q2 2024 - Awareness', 'Active', 'loans', 'Loans', 'aud001', 'Prospecting', 'Awareness', 'Mobile', 'Feed', '2024-05-20', '2024-05-15', 1050000, 73500, 1008, 7350.00, 820000, 2.65, 735.00, 105000, false, null, null, CURRENT_TIMESTAMP());

-- Create and populate creative attributes table
CREATE TABLE `isracard_analytics.creative_attributes` (
  creative_id STRING,
  format STRING,
  video_length STRING,
  has_presenter BOOL,
  cta_text STRING,
  creative_theme STRING,
  color_scheme STRING
);

INSERT INTO `isracard_analytics.creative_attributes` VALUES
('CR001', 'Video', '30s', true, 'Apply Now', 'Professional', 'Isracard Blue'),
('CR002', 'Video', '45s', true, 'Learn More', 'Lifestyle', 'Isracard Teal'),
('CR003', 'Static', null, false, 'Get Started', 'Minimal', 'Isracard Pink'),
('CR004', 'Video', '15s', true, 'Get Cashback', 'Dynamic', 'Isracard Blue'),
('CR005', 'Video', '30s', false, 'Discover Benefits', 'Corporate', 'Isracard Teal'),
('CR006', 'Static', null, false, 'Learn More', 'Clean', 'Isracard Pink'),
('CR007', 'GIF', null, true, 'Explore Benefits', 'Animated', 'Isracard Blue'),
('CR008', 'Video', '60s+', false, 'Contact Sales', 'Corporate', 'Isracard Black'),
('CR009', 'Static', null, false, 'Get Quote', 'Professional', 'Isracard Teal'),
('CR010', 'GIF', null, false, 'Apply Today', 'Dynamic', 'Isracard Pink'),
('CR011', 'Static', null, true, 'Compare Rates', 'Informative', 'Isracard Blue'),
('CR012', 'Video', '15s', true, 'Earn Cashback', 'Lifestyle', 'Isracard Teal'),
('CR013', 'Static', null, false, 'Join Now', 'Modern', 'Isracard Pink'),
('CR014', 'Video', '30s', true, 'Discover More', 'Professional', 'Isracard Blue'),
('CR015', 'Static', null, false, 'Get Benefits', 'Clean', 'Isracard Teal');

-- Create and populate platforms table
CREATE TABLE `isracard_analytics.platforms` (
  platform_id STRING,
  platform_name STRING,
  platform_category STRING
);

INSERT INTO `isracard_analytics.platforms` VALUES
('fb', 'Facebook', 'Social Media'),
('yt', 'YouTube', 'Video Platform'),
('dv360', 'DV360', 'Programmatic');

-- Create and populate products table
CREATE TABLE `isracard_analytics.products` (
  product_id STRING,
  product_name STRING,
  product_category STRING,
  target_audience STRING,
  product_priority STRING
);

INSERT INTO `isracard_analytics.products` VALUES
('loans', 'Loans', 'Financial Services', 'Adults 25-55', 'High'),
('creditcards', 'Credit Cards', 'Financial Services', 'Adults 18-65', 'High'),
('benefits', 'Benefits', 'Employee Services', 'Corporate Clients', 'Medium'),
('b2b', 'B2B', 'Business Services', 'Business Owners', 'Medium');

-- Create and populate campaigns table
CREATE TABLE `isracard_analytics.campaigns` (
  campaign_id STRING,
  campaign_name STRING,
  campaign_type STRING,
  campaign_objective STRING,
  campaign_start_date DATE,
  campaign_end_date DATE,
  campaign_budget FLOAT64
);

INSERT INTO `isracard_analytics.campaigns` VALUES
('camp001', 'Loans Q2 2024 - Awareness', 'Awareness', 'Brand Awareness', '2024-05-15', '2024-06-30', 150000.00),
('camp002', 'Cashback Spring Campaign', 'Conversion', 'Lead Generation', '2024-05-12', '2024-06-15', 200000.00),
('camp003', 'Benefits Awareness Q2', 'Awareness', 'Brand Awareness', '2024-05-20', '2024-07-20', 100000.00),
('camp004', 'B2B Corporate Solutions', 'Lead Generation', 'Lead Generation', '2024-05-22', '2024-08-22', 75000.00),
('camp005', 'Loans Remarketing Campaign', 'Remarketing', 'Conversions', '2024-05-23', '2024-06-23', 120000.00),
('camp006', 'Credit Card Cashback Promo', 'Conversion', 'Conversions', '2024-05-20', '2024-06-20', 180000.00),
('camp007', 'Employee Benefits Campaign', 'Awareness', 'Brand Awareness', '2024-05-18', '2024-07-18', 90000.00);

-- Create and populate live campaigns table
CREATE TABLE `isracard_analytics.live_campaigns` (
  campaign_id STRING,
  creative_id STRING,
  platform_id STRING,
  is_live BOOL,
  last_updated TIMESTAMP,
  daily_spend FLOAT64
);

INSERT INTO `isracard_analytics.live_campaigns` VALUES
('camp001', 'CR001', 'fb', true, CURRENT_TIMESTAMP(), 850.00),
('camp001', 'CR002', 'yt', true, CURRENT_TIMESTAMP(), 620.00),
('camp001', 'CR003', 'dv360', true, CURRENT_TIMESTAMP(), 525.00),
('camp002', 'CR004', 'fb', true, CURRENT_TIMESTAMP(), 1470.00),
('camp002', 'CR005', 'yt', true, CURRENT_TIMESTAMP(), 1295.00),
('camp003', 'CR006', 'dv360', true, CURRENT_TIMESTAMP(), 720.00),
('camp003', 'CR007', 'fb', true, CURRENT_TIMESTAMP(), 588.00),
('camp004', 'CR008', 'yt', true, CURRENT_TIMESTAMP(), 390.00),
('camp004', 'CR009', 'dv360', true, CURRENT_TIMESTAMP(), 270.00),
('camp005', 'CR010', 'fb', true, CURRENT_TIMESTAMP(), 770.00),
('camp005', 'CR011', 'dv360', true, CURRENT_TIMESTAMP(), 574.00),
('camp006', 'CR012', 'yt', true, CURRENT_TIMESTAMP(), 1155.00),
('camp006', 'CR013', 'fb', true, CURRENT_TIMESTAMP(), 994.00),
('camp007', 'CR014', 'yt', true, CURRENT_TIMESTAMP(), 630.00),
('camp007', 'CR015', 'dv360', true, CURRENT_TIMESTAMP(), 534.00);

-- Create and populate audience segments table
CREATE TABLE `isracard_analytics.audience_segments` (
  audience_id STRING,
  audience_name STRING,
  audience_type STRING,
  audience_size INT64,
  demographic_profile STRING
);

INSERT INTO `isracard_analytics.audience_segments` VALUES
('aud001', 'High Income Prospects', 'Prospecting', 2500000, 'Adults 25-45, High Income'),
('aud002', 'Existing Customer Remarketing', 'Remarketing', 850000, 'Existing Customers'),
('aud003', 'Lookalike High Value', 'Lookalike', 1800000, 'Similar to High Value Customers'),
('aud004', 'Business Decision Makers', 'Prospecting', 450000, 'Business Owners, C-Level');

-- Add more historical data for better trend analysis
INSERT INTO `isracard_analytics.creative_performance` 
SELECT 
  CONCAT('cp_hist_', ROW_NUMBER() OVER()) as creative_performance_id,
  creative_id,
  creative_name,
  creative_image_url,
  platform_id,
  platform_name,
  campaign_id,
  campaign_name,
  campaign_status,
  product_id,
  product_name,
  audience_id,
  audience_type,
  funnel_stage,
  device_type,
  placement,
  DATE_SUB(CURRENT_DATE(), INTERVAL CAST(RAND() * 30 AS INT64) DAY) as date,
  start_date,
  CAST(impressions * (0.8 + RAND() * 0.4) AS INT64) as impressions,
  CAST(clicks * (0.8 + RAND() * 0.4) AS INT64) as clicks,
  CAST(conversions * (0.8 + RAND() * 0.4) AS INT64) as conversions,
  spend * (0.8 + RAND() * 0.4) as spend,
  CAST(views * (0.8 + RAND() * 0.4) AS INT64) as views,
  quality_score * (0.9 + RAND() * 0.2) as quality_score,
  daily_spend * (0.8 + RAND() * 0.4) as daily_spend,
  CAST(daily_impressions * (0.8 + RAND() * 0.4) AS INT64) as daily_impressions,
  is_outlier,
  outlier_type,
  variance_from_benchmark,
  CURRENT_TIMESTAMP() as updated_at
FROM `isracard_analytics.creative_performance`
WHERE creative_performance_id LIKE 'cp%'
AND creative_performance_id NOT LIKE 'cp_hist_%';
