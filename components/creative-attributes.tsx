"use client"

import { useState } from "react"
import { Pie, PieChart, ResponsiveContainer, Cell } from "recharts"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { ChartContainer, ChartTooltip, ChartTooltipContent } from "@/components/ui/chart"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"

const formatData = [
  { name: "Video", value: 45, cpa: 6.85 },
  { name: "Static", value: 30, cpa: 7.2 },
  { name: "GIF", value: 25, cpa: 7.45 },
]

const productPerformanceData = [
  { product: "Credit Cards", conversions: 5200, cpa: 6.45, cvr: 1.65, performance: "high" },
  { product: "Loans", conversions: 4800, cpa: 6.85, cvr: 1.48, performance: "high" },
  { product: "Benefits", conversions: 3200, cpa: 7.65, cvr: 1.25, performance: "medium" },
  { product: "B2B", conversions: 1500, cpa: 8.95, cvr: 1.12, performance: "low" },
]

const devicePerformanceData = [
  { device: "Mobile", conversions: 9200, cpa: 6.85, ctr: 7.2, cvr: 1.45 },
  { device: "Desktop", conversions: 5500, cpa: 7.45, ctr: 6.1, cvr: 1.38 },
]

const COLORS = ["#0070BA", "#E91E63", "#000000", "#4A90E2"]

const videoCreatives = {
  "15s": [
    {
      id: "1",
      name: "Summer Sale Ad",
      platform: "Facebook",
      thumbnail: "https://via.placeholder.com/50",
      conversions: 1200,
      ctr: 9.1,
      cpa: 5.85,
    },
    {
      id: "2",
      name: "New Product Launch",
      platform: "YouTube",
      thumbnail: "https://via.placeholder.com/50",
      conversions: 1000,
      ctr: 8.5,
      cpa: 6.2,
    },
  ],
  "30s": [
    {
      id: "3",
      name: "Holiday Discount",
      platform: "Instagram",
      thumbnail: "https://via.placeholder.com/50",
      conversions: 1600,
      ctr: 7.8,
      cpa: 6.5,
    },
    {
      id: "4",
      name: "Limited Time Offer",
      platform: "TikTok",
      thumbnail: "https://via.placeholder.com/50",
      conversions: 1400,
      ctr: 7.2,
      cpa: 7.0,
    },
  ],
  "45s": [
    {
      id: "5",
      name: "Back to School Promo",
      platform: "Facebook",
      thumbnail: "https://via.placeholder.com/50",
      conversions: 800,
      ctr: 6.5,
      cpa: 7.25,
    },
    {
      id: "6",
      name: "Anniversary Special",
      platform: "YouTube",
      thumbnail: "https://via.placeholder.com/50",
      conversions: 700,
      ctr: 6.0,
      cpa: 7.5,
    },
  ],
  "60s+": [
    {
      id: "7",
      name: "Long Form Explainer",
      platform: "LinkedIn",
      thumbnail: "https://via.placeholder.com/50",
      conversions: 500,
      ctr: 5.5,
      cpa: 8.0,
    },
    {
      id: "8",
      name: "Brand Story",
      platform: "Vimeo",
      thumbnail: "https://via.placeholder.com/50",
      conversions: 400,
      ctr: 5.0,
      cpa: 8.5,
    },
  ],
}

export function CreativeAttributes() {
  const [expandedVideoLength, setExpandedVideoLength] = useState<string | null>(null)

  const videoLengthData = [
    { length: "15s", conversions: 3200, cpa: 6.45, ctr: 8.2, count: 12 },
    { length: "30s", conversions: 4800, cpa: 6.85, ctr: 7.1, count: 18 },
    { length: "45s", conversions: 2100, cpa: 7.65, ctr: 6.2, count: 8 },
    { length: "60s+", conversions: 1200, cpa: 8.95, ctr: 5.1, count: 5 },
  ]

  return (
    <div className="grid grid-cols-1 gap-6">
      <Card className="border-primary/20">
        <CardHeader>
          <CardTitle className="text-primary">Format Performance</CardTitle>
          <CardDescription>Distribution and CPA by creative format</CardDescription>
        </CardHeader>
        <CardContent>
          <ChartContainer
            config={{
              video: { label: "Video", color: "#0070BA" },
              static: { label: "Static", color: "#E91E63" },
              gif: { label: "GIF", color: "#000000" },
            }}
            className="h-[250px]"
          >
            <ResponsiveContainer width="100%" height="100%">
              <PieChart>
                <Pie
                  data={formatData}
                  cx="50%"
                  cy="50%"
                  labelLine={false}
                  label={({ name, value }) => `${name}: ${value}%`}
                  outerRadius={80}
                  fill="#8884d8"
                  dataKey="value"
                >
                  {formatData.map((entry, index) => (
                    <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                  ))}
                </Pie>
                <ChartTooltip content={<ChartTooltipContent />} />
              </PieChart>
            </ResponsiveContainer>
          </ChartContainer>
        </CardContent>
      </Card>

      <Card className="border-primary/20">
        <CardHeader>
          <CardTitle className="text-primary">Video Length Performance</CardTitle>
          <CardDescription>Performance analysis by video duration for video creatives</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="space-y-4">
            {videoLengthData.map((video) => (
              <div key={video.length}>
                <div className="flex items-center justify-between p-4 border border-primary/20 rounded-lg hover:bg-primary/5">
                  <div className="flex items-center space-x-4">
                    <div className="font-medium text-primary">{video.length}</div>
                    <Badge variant="outline" className="border-primary text-primary">
                      {video.count} creatives
                    </Badge>
                  </div>
                  <div className="flex items-center space-x-6 text-sm">
                    <div>
                      <span className="text-muted-foreground">Conversions: </span>
                      <span className="font-medium text-primary">{video.conversions.toLocaleString()}</span>
                    </div>
                    <div>
                      <span className="text-muted-foreground">CTR: </span>
                      <span className="font-medium text-primary">{video.ctr.toFixed(1)}%</span>
                    </div>
                    <div>
                      <span className="text-muted-foreground">CPA: </span>
                      <span className="font-medium">${video.cpa.toFixed(2)}</span>
                    </div>
                  </div>
                </div>
                <Button
                  variant="link"
                  size="sm"
                  onClick={() => setExpandedVideoLength((prev) => (prev === video.length ? null : video.length))}
                >
                  {expandedVideoLength === video.length ? "Hide Details" : "Show Details"}
                </Button>

                {expandedVideoLength === video.length && (
                  <div className="mt-4 space-y-2">
                    {videoCreatives[video.length as keyof typeof videoCreatives].map((creative) => (
                      <div
                        key={creative.id}
                        className="flex items-center justify-between p-4 border border-primary/20 rounded-lg"
                      >
                        <div className="flex items-center space-x-4">
                          <img
                            src={creative.thumbnail || "/placeholder.svg"}
                            alt={creative.name}
                            className="w-8 h-8 rounded"
                          />
                          <div>
                            <div className="font-medium text-primary">{creative.name}</div>
                            <div className="text-sm text-muted-foreground">
                              {creative.platform} - ID: {creative.id}
                            </div>
                          </div>
                        </div>
                        <div className="flex items-center space-x-6 text-sm">
                          <div>
                            <span className="text-muted-foreground">Conversions: </span>
                            <span className="font-medium text-primary">{creative.conversions.toLocaleString()}</span>
                          </div>
                          <div>
                            <span className="text-muted-foreground">CTR: </span>
                            <span className="font-medium text-primary">{creative.ctr.toFixed(1)}%</span>
                          </div>
                          <div>
                            <span className="text-muted-foreground">CPA: </span>
                            <span className="font-medium">${creative.cpa.toFixed(2)}</span>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      <Card className="border-primary/20">
        <CardHeader>
          <CardTitle className="text-primary">Product Performance Analysis</CardTitle>
          <CardDescription>Conversion, CVR and CPA performance by Isracard product line</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="space-y-4">
            {productPerformanceData.map((product) => (
              <div
                key={product.product}
                className="flex items-center justify-between p-4 border border-primary/20 rounded-lg hover:bg-primary/5"
              >
                <div className="flex items-center space-x-4">
                  <div className="font-medium text-primary">{product.product}</div>
                  <Badge
                    variant={
                      product.performance === "high"
                        ? "default"
                        : product.performance === "medium"
                          ? "secondary"
                          : "destructive"
                    }
                    className={
                      product.performance === "high"
                        ? "bg-primary text-white"
                        : product.performance === "medium"
                          ? "bg-secondary/10 text-secondary border-secondary"
                          : ""
                    }
                  >
                    {product.performance} performance
                  </Badge>
                </div>
                <div className="flex items-center space-x-6 text-sm">
                  <div>
                    <span className="text-muted-foreground">Conversions: </span>
                    <span className="font-medium text-primary">{product.conversions.toLocaleString()}</span>
                  </div>
                  <div>
                    <span className="text-muted-foreground">CVR: </span>
                    <span className="font-medium text-secondary">{product.cvr.toFixed(2)}%</span>
                  </div>
                  <div>
                    <span className="text-muted-foreground">CPA: </span>
                    <span className="font-medium">${product.cpa.toFixed(2)}</span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      <Card className="border-primary/20">
        <CardHeader>
          <CardTitle className="text-primary">Device Performance</CardTitle>
          <CardDescription>Performance comparison by device type</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="space-y-4">
            {devicePerformanceData.map((device) => (
              <div
                key={device.device}
                className="flex items-center justify-between p-4 border border-primary/20 rounded-lg hover:bg-primary/5"
              >
                <div className="font-medium text-primary">{device.device}</div>
                <div className="flex items-center space-x-6 text-sm">
                  <div>
                    <span className="text-muted-foreground">Conversions: </span>
                    <span className="font-medium text-primary">{device.conversions.toLocaleString()}</span>
                  </div>
                  <div>
                    <span className="text-muted-foreground">CTR: </span>
                    <span className="font-medium text-primary">{device.ctr.toFixed(2)}%</span>
                  </div>
                  <div>
                    <span className="text-muted-foreground">CVR: </span>
                    <span className="font-medium text-secondary">{device.cvr.toFixed(2)}%</span>
                  </div>
                  <div>
                    <span className="text-muted-foreground">CPA: </span>
                    <span className="font-medium">${device.cpa.toFixed(2)}</span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
