export interface Creative {
  id: string
  name: string
  platform: string
  funnelStage: string
  audienceType: string
  product: string
  format: string
  videoLength?: string
  presenter: boolean
  cta?: string
  deviceType: string
  placement: string
  impressions: number
  clicks: number
  conversions: number
  spend: number
  views?: number
  ctr: number
  cvr: number
  cpa: number
  cpv?: number
  qualityScore: number
  imageUrl?: string
}

export interface MetricData {
  title: string
  value: string
  change: string
  trend: "up" | "down"
  icon: any
}

export interface PlatformData {
  platform: string
  impressions: number
  clicks: number
  conversions: number
  spend: number
  ctr: number
  cvr: number
  cpa: number
  cpv?: number
}
