-- Add more diverse creative performance data for richer analytics

-- Insert additional high-performing creatives
INSERT INTO `isracard_analytics.creative_performance` VALUES
-- More Credit Card winners
('cp021', 'CR016', 'premium_card_lifestyle_video', '/placeholder.svg?height=60&width=100', 'yt', 'YouTube', 'camp008', 'Premium Card Launch', 'Active', 'creditcards', 'Credit Cards', 'aud001', 'Prospecting', 'Awareness', 'Desktop', 'In-stream', '2024-05-25', '2024-05-10', 2200000, 154000, 2310, 15400.00, 1760000, 3.65, 1540.00, 220000, false, 'top_performer', '+42%', CURRENT_TIMESTAMP()),
('cp022', 'CR017', 'travel_rewards_static_mobile', '/placeholder.svg?height=60&width=100', 'fb', 'Facebook', 'camp008', 'Premium Card Launch', 'Live', 'creditcards', 'Credit Cards', 'aud003', 'Lookalike', 'Conversion', 'Mobile', 'Feed', '2024-05-25', '2024-05-10', 1950000, 136500, 2047, 13650.00, null, 3.25, 1365.00, 195000, false, 'top_performer', '+31%', CURRENT_TIMESTAMP()),

-- More underperforming B2B creatives
('cp023', 'CR018', 'b2b_complex_infographic_static', '/placeholder.svg?height=60&width=100', 'dv360', 'DV360', 'camp009', 'B2B Financial Solutions', 'Active', 'b2b', 'B2B', 'aud004', 'Prospecting', 'Awareness', 'Desktop', 'Native', '2024-05-25', '2024-05-24', 380000, 15200, 152, 2280.00, null, 1.65, 228.00, 38000, true, 'underperforming', '-52%', CURRENT_TIMESTAMP()),
('cp024', 'CR019', 'corporate_banking_video_90s', '/placeholder.svg?height=60&width=100', 'yt', 'YouTube', 'camp009', 'B2B Financial Solutions', 'Active', 'b2b', 'B2B', 'aud004', 'Prospecting', 'Mid', 'Desktop', 'In-stream', '2024-05-25', '2024-05-24', 420000, 16800, 168, 2520.00, 336000, 1.75, 252.00, 42000, true, 'underperforming', '-48%', CURRENT_TIMESTAMP()),

-- Mixed performance Benefits creatives
('cp025', 'CR020', 'health_benefits_animation_gif', '/placeholder.svg?height=60&width=100', 'fb', 'Facebook', 'camp010', 'Health Benefits Promo', 'Live', 'benefits', 'Benefits', 'aud002', 'Remarketing', 'Mid', 'Mobile', 'Stories', '2024-05-25', '2024-05-19', 1150000, 80500, 1012, 8050.00, null, 2.85, 805.00, 115000, false, null, null, CURRENT_TIMESTAMP()),
('cp026', 'CR021', 'retirement_planning_video_45s', '/placeholder.svg?height=60&width=100', 'yt', 'YouTube', 'camp010', 'Health Benefits Promo', 'Active', 'benefits', 'Benefits', 'aud003', 'Lookalike', 'Conversion', 'Desktop', 'In-stream', '2024-05-25', '2024-05-19', 980000, 68600, 863, 6860.00, 784000, 2.95, 686.00, 98000, false, null, null, CURRENT_TIMESTAMP()),

-- Seasonal Loans campaign
('cp027', 'CR022', 'summer_vacation_loan_video', '/placeholder.svg?height=60&width=100', 'fb', 'Facebook', 'camp011', 'Summer Vacation Loans', 'Active', 'loans', 'Loans', 'aud001', 'Prospecting', 'Awareness', 'Mobile', 'Feed', '2024-05-25', '2024-05-21', 1680000, 117600, 1764, 11760.00, 1344000, 3.45, 1176.00, 168000, false, 'top_performer', '+38%', CURRENT_TIMESTAMP()),
('cp028', 'CR023', 'home_improvement_static_desktop', '/placeholder.svg?height=60&width=100', 'dv360', 'DV360', 'camp011', 'Summer Vacation Loans', 'Live', 'loans', 'Loans', 'aud002', 'Remarketing', 'Conversion', 'Desktop', 'Native', '2024-05-25', '2024-05-21', 1420000, 99400, 1491, 9940.00, null, 3.15, 994.00, 142000, false, null, null, CURRENT_TIMESTAMP());

-- Add corresponding creative attributes
INSERT INTO `isracard_analytics.creative_attributes` VALUES
('CR016', 'Video', '30s', true, 'Apply for Premium', 'Luxury', 'Isracard Gold'),
('CR017', 'Static', null, false, 'Earn Travel Points', 'Travel', 'Isracard Blue'),
('CR018', 'Static', null, false, 'Learn More', 'Complex', 'Isracard Black'),
('CR019', 'Video', '60s+', false, 'Schedule Consultation', 'Corporate', 'Isracard Black'),
('CR020', 'GIF', null, true, 'Explore Benefits', 'Health', 'Isracard Green'),
('CR021', 'Video', '45s', true, 'Plan Your Future', 'Financial', 'Isracard Blue'),
('CR022', 'Video', '30s', true, 'Get Your Loan', 'Lifestyle', 'Isracard Summer'),
('CR023', 'Static', null, false, 'Improve Your Home', 'Home', 'Isracard Teal');

-- Add more campaigns
INSERT INTO `isracard_analytics.campaigns` VALUES
('camp008', 'Premium Card Launch', 'Conversion', 'Acquisitions', '2024-05-10', '2024-07-10', 250000.00),
('camp009', 'B2B Financial Solutions', 'Lead Generation', 'Lead Generation', '2024-05-24', '2024-08-24', 85000.00),
('camp010', 'Health Benefits Promo', 'Awareness', 'Brand Awareness', '2024-05-19', '2024-07-19', 110000.00),
('camp011', 'Summer Vacation Loans', 'Conversion', 'Conversions', '2024-05-21', '2024-07-21', 160000.00);

-- Add to live campaigns
INSERT INTO `isracard_analytics.live_campaigns` VALUES
('camp008', 'CR016', 'yt', true, CURRENT_TIMESTAMP(), 1540.00),
('camp008', 'CR017', 'fb', true, CURRENT_TIMESTAMP(), 1365.00),
('camp009', 'CR018', 'dv360', true, CURRENT_TIMESTAMP(), 228.00),
('camp009', 'CR019', 'yt', true, CURRENT_TIMESTAMP(), 252.00),
('camp010', 'CR020', 'fb', true, CURRENT_TIMESTAMP(), 805.00),
('camp010', 'CR021', 'yt', true, CURRENT_TIMESTAMP(), 686.00),
('camp011', 'CR022', 'fb', true, CURRENT_TIMESTAMP(), 1176.00),
('camp011', 'CR023', 'dv360', true, CURRENT_TIMESTAMP(), 994.00);

-- Create hourly data for real-time dashboard (last 24 hours)
INSERT INTO `isracard_analytics.creative_performance`
SELECT 
  CONCAT('cp_hourly_', ROW_NUMBER() OVER()) as creative_performance_id,
  'CR001' as creative_id,
  'creative_loans_may25_video_30s' as creative_name,
  '/placeholder.svg?height=60&width=100' as creative_image_url,
  'fb' as platform_id,
  'Facebook' as platform_name,
  'camp001' as campaign_id,
  'Loans Q2 2024 - Awareness' as campaign_name,
  'Active' as campaign_status,
  'loans' as product_id,
  'Loans' as product_name,
  'aud001' as audience_id,
  'Prospecting' as audience_type,
  'Awareness' as funnel_stage,
  'Mobile' as device_type,
  'Feed' as placement,
  CURRENT_DATE() as date,
  '2024-05-15' as start_date,
  CAST(50000 + RAND() * 20000 AS INT64) as impressions,
  CAST(3500 + RAND() * 1500 AS INT64) as clicks,
  CAST(50 + RAND() * 30 AS INT64) as conversions,
  350.00 + RAND() * 150 as spend,
  CAST(40000 + RAND() * 15000 AS INT64) as views,
  2.8 + RAND() * 0.6 as quality_score,
  350.00 + RAND() * 150 as daily_spend,
  CAST(50000 + RAND() * 20000 AS INT64) as daily_impressions,
  false as is_outlier,
  null as outlier_type,
  null as variance_from_benchmark,
  TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL hour_offset HOUR) as updated_at
FROM UNNEST(GENERATE_ARRAY(0, 23)) AS hour_offset;
