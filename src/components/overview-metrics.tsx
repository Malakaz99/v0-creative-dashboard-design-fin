"use client"

import { TrendingUp, TrendingDown, Eye, MousePointer, Target, DollarSign, Play, Star } from "lucide-react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"

const metrics = [
  {
    title: "Total Impressions",
    value: "12.4M",
    change: "+12.5%",
    trend: "up",
    icon: Eye,
  },
  {
    title: "Total Clicks",
    value: "847K",
    change: "+8.2%",
    trend: "up",
    icon: MousePointer,
  },
  {
    title: "Conversions",
    value: "23.1K",
    change: "-2.1%",
    trend: "down",
    icon: Target,
  },
  {
    title: "Total Spend",
    value: "$156.8K",
    change: "+5.7%",
    trend: "up",
    icon: DollarSign,
  },
  {
    title: "Average CTR",
    value: "6.83%",
    change: "+0.4%",
    trend: "up",
    icon: TrendingUp,
  },
  {
    title: "Average CVR",
    value: "2.73%",
    change: "+0.2%",
    trend: "up",
    icon: Target,
  },
  {
    title: "Average CPA",
    value: "$6.79",
    change: "-8.3%",
    trend: "down",
    icon: TrendingDown,
  },
  {
    title: "Average CPV",
    value: "$0.12",
    change: "-5.1%",
    trend: "down",
    icon: Play,
  },
  {
    title: "Avg Creative QS",
    value: "2.73",
    change: "+0.15",
    trend: "up",
    icon: Star,
  },
]

export function OverviewMetrics() {
  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-3 gap-4">
      {metrics.map((metric) => {
        const Icon = metric.icon
        const isPositive = metric.trend === "up"

        return (
          <Card key={metric.title} className="border-primary/20 hover:border-primary/40 transition-colors">
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium text-primary">{metric.title}</CardTitle>
              <Icon className="h-4 w-4 text-primary" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-primary">{metric.value}</div>
              <p className={`text-xs ${isPositive ? "text-green-600" : "text-red-600"}`}>
                {metric.change} from last period
              </p>
            </CardContent>
          </Card>
        )
      })}
    </div>
  )
}
