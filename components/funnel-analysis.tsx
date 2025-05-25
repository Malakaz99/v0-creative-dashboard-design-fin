"use client"

import { Line, LineChart, ResponsiveContainer, XAxis, YAxis, CartesianGrid, Legend } from "recharts"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { ChartContainer, ChartTooltip, ChartTooltipContent } from "@/components/ui/chart"

const funnelData = [
  {
    stage: "Awareness",
    impressions: 8500000,
    clicks: 510000,
    conversions: 5100,
    ctr: 6.0,
    cvr: 1.0,
    cpa: 8.5,
  },
  {
    stage: "Mid-Funnel",
    impressions: 2800000,
    clicks: 196000,
    conversions: 2940,
    ctr: 7.0,
    cvr: 1.5,
    cpa: 7.2,
  },
  {
    stage: "Conversion",
    impressions: 1100000,
    clicks: 88000,
    conversions: 1760,
    ctr: 8.0,
    cvr: 2.0,
    cpa: 6.25,
  },
]

export function FunnelAnalysis() {
  return (
    <Card className="border-primary/20">
      <CardHeader>
        <CardTitle className="text-primary">Funnel Stage Performance</CardTitle>
        <CardDescription>Performance metrics across different funnel stages</CardDescription>
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
            <LineChart data={funnelData}>
              <CartesianGrid strokeDasharray="3 3" stroke="#0070BA20" />
              <XAxis dataKey="stage" stroke="#0070BA" />
              <YAxis stroke="#0070BA" />
              <ChartTooltip content={<ChartTooltipContent />} />
              <Legend />
              <Line type="monotone" dataKey="ctr" stroke="#0070BA" strokeWidth={3} />
              <Line type="monotone" dataKey="cvr" stroke="#E91E63" strokeWidth={3} />
              <Line type="monotone" dataKey="cpa" stroke="#000000" strokeWidth={3} />
            </LineChart>
          </ResponsiveContainer>
        </ChartContainer>
      </CardContent>
    </Card>
  )
}
