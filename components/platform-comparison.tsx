"use client"

import { Bar, BarChart, ResponsiveContainer, XAxis, YAxis, CartesianGrid, Legend } from "recharts"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { ChartContainer, ChartTooltip, ChartTooltipContent } from "@/components/ui/chart"

const platformData = [
  {
    platform: "Facebook",
    impressions: 4200000,
    clicks: 285000,
    conversions: 4200,
    spend: 28500,
    ctr: 6.79,
    cvr: 1.47,
    cpa: 6.79,
    cpv: 0.0085,
  },
  {
    platform: "YouTube",
    impressions: 3800000,
    clicks: 266000,
    conversions: 3800,
    spend: 24200,
    ctr: 7.0,
    cvr: 1.43,
    cpa: 6.37,
    cpv: 0.0078,
  },
  {
    platform: "DV360",
    impressions: 2900000,
    clicks: 174000,
    conversions: 2320,
    spend: 18200,
    ctr: 6.0,
    cvr: 1.33,
    cpa: 7.84,
    cpv: null,
  },
]

export function PlatformComparison() {
  return (
    <Card className="border-primary/20">
      <CardHeader>
        <CardTitle className="text-primary">Platform Performance Comparison</CardTitle>
        <CardDescription>Compare key metrics across all advertising platforms</CardDescription>
      </CardHeader>
      <CardContent>
        <ChartContainer
          config={{
            ctr: {
              label: "CTR (%)",
              color: "#0070BA",
            },
            cvr: {
              label: "CVR (%)",
              color: "#E91E63",
            },
            cpa: {
              label: "CPA ($)",
              color: "#000000",
            },
          }}
          className="h-[300px]"
        >
          <ResponsiveContainer width="100%" height="100%">
            <BarChart data={platformData}>
              <CartesianGrid strokeDasharray="3 3" stroke="#0070BA20" />
              <XAxis dataKey="platform" stroke="#0070BA" />
              <YAxis yAxisId="left" stroke="#0070BA" />
              <YAxis yAxisId="right" orientation="right" stroke="#E91E63" />
              <ChartTooltip content={<ChartTooltipContent />} />
              <Legend />
              <Bar yAxisId="left" dataKey="ctr" fill="#0070BA" name="CTR (%)" />
              <Bar yAxisId="left" dataKey="cvr" fill="#E91E63" name="CVR (%)" />
              <Bar yAxisId="right" dataKey="cpa" fill="#000000" name="CPA ($)" />
            </BarChart>
          </ResponsiveContainer>
        </ChartContainer>
      </CardContent>
    </Card>
  )
}
