"use client"

import { useState } from "react"
import { MoreHorizontal, ExternalLink, TrendingUp, TrendingDown } from "lucide-react"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table"

const creativeData = [
  {
    id: "CR001",
    name: "creative_loans_may25",
    platform: "Facebook",
    funnelStage: "Awareness",
    audienceType: "Prospecting",
    product: "Loans",
    format: "Video",
    videoLength: "30s",
    presenter: true,
    cta: "Apply Now",
    deviceType: "Mobile",
    placement: "Feed",
    impressions: 1250000,
    clicks: 85000,
    conversions: 1200,
    spend: 8500,
    views: 950000,
    ctr: 6.8,
    cvr: 1.41,
    cpa: 7.08,
    cpv: 0.009,
    qualityScore: 2.85,
    imageUrl: "/placeholder.svg?height=60&width=100",
  },
  // Additional sample data would go here...
]

export function CreativePerformanceTable() {
  const [sortBy, setSortBy] = useState("qualityScore")
  const [sortOrder, setSortOrder] = useState("asc")

  const formatNumber = (num: number) => {
    if (num >= 1000000) return `${(num / 1000000).toFixed(1)}M`
    if (num >= 1000) return `${(num / 1000).toFixed(1)}K`
    return num.toString()
  }

  const formatCurrency = (num: number) => `$${num.toFixed(2)}`
  const formatPercentage = (num: number) => `${num.toFixed(2)}%`

  const sortedData = [...creativeData].sort((a, b) => b.qualityScore - a.qualityScore)

  return (
    <Card className="border-primary/20">
      <CardHeader>
        <CardTitle className="text-primary">Creative Performance Details</CardTitle>
        <CardDescription>Detailed performance metrics for all creative assets</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="rounded-md border border-primary/20 overflow-x-auto">
          <Table>
            <TableHeader>
              <TableRow className="bg-primary/5">
                <TableHead className="text-primary font-semibold">Creative</TableHead>
                <TableHead className="text-primary font-semibold">Platform</TableHead>
                <TableHead className="text-primary font-semibold">Product</TableHead>
                <TableHead className="text-primary font-semibold">Funnel Stage</TableHead>
                <TableHead className="text-primary font-semibold">Audience</TableHead>
                <TableHead className="text-primary font-semibold">Format</TableHead>
                <TableHead className="text-primary font-semibold">Device</TableHead>
                <TableHead className="text-primary font-semibold">Placement</TableHead>
                <TableHead className="text-right text-primary font-semibold">Impressions</TableHead>
                <TableHead className="text-right text-primary font-semibold">Clicks</TableHead>
                <TableHead className="text-right text-primary font-semibold">Conversions</TableHead>
                <TableHead className="text-right text-primary font-semibold">Spend</TableHead>
                <TableHead className="text-right text-primary font-semibold">CTR</TableHead>
                <TableHead className="text-right text-primary font-semibold">CVR</TableHead>
                <TableHead className="text-right text-primary font-semibold">CPA</TableHead>
                <TableHead className="text-right text-primary font-semibold">CPV</TableHead>
                <TableHead className="text-right text-primary font-semibold">QS</TableHead>
                <TableHead></TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {sortedData.map((creative) => (
                <TableRow key={creative.id} className="hover:bg-primary/5">
                  <TableCell className="font-medium">
                    <div className="flex items-center space-x-3">
                      <div className="relative">
                        <img
                          src={creative.imageUrl || "/placeholder.svg"}
                          alt={creative.name}
                          className="w-20 h-12 object-cover rounded border border-primary/20"
                        />
                        {creative.format === "Video" && (
                          <div className="absolute bottom-0 right-0 bg-primary bg-opacity-90 text-white text-xs px-1 rounded-tl">
                            {creative.videoLength}
                          </div>
                        )}
                      </div>
                      <div>
                        <div className="font-medium text-sm text-primary">{creative.id}</div>
                        <div className="text-xs text-muted-foreground max-w-[200px] truncate">{creative.name}</div>
                        {creative.cta && <div className="text-xs text-secondary mt-1">CTA: {creative.cta}</div>}
                      </div>
                    </div>
                  </TableCell>
                  <TableCell>
                    <Badge variant="outline" className="border-primary text-primary">
                      {creative.platform}
                    </Badge>
                  </TableCell>
                  <TableCell>
                    <Badge variant="secondary" className="bg-secondary/10 text-secondary border-secondary">
                      {creative.product}
                    </Badge>
                  </TableCell>
                  <TableCell>
                    <Badge
                      variant={
                        creative.funnelStage === "Awareness"
                          ? "default"
                          : creative.funnelStage === "Mid"
                            ? "secondary"
                            : "destructive"
                      }
                      className={
                        creative.funnelStage === "Awareness"
                          ? "bg-primary text-white"
                          : creative.funnelStage === "Mid"
                            ? "bg-secondary/10 text-secondary border-secondary"
                            : ""
                      }
                    >
                      {creative.funnelStage}
                    </Badge>
                  </TableCell>
                  <TableCell>{creative.audienceType}</TableCell>
                  <TableCell>
                    <div className="flex items-center space-x-1">
                      <span>{creative.format}</span>
                      {creative.presenter && (
                        <Badge variant="outline" className="text-xs border-primary text-primary">
                          Presenter
                        </Badge>
                      )}
                    </div>
                  </TableCell>
                  <TableCell>
                    <Badge variant="outline" className="border-primary text-primary">
                      {creative.deviceType}
                    </Badge>
                  </TableCell>
                  <TableCell>
                    <Badge variant="outline" className="border-primary text-primary">
                      {creative.placement}
                    </Badge>
                  </TableCell>
                  <TableCell className="text-right">{formatNumber(creative.impressions)}</TableCell>
                  <TableCell className="text-right">{formatNumber(creative.clicks)}</TableCell>
                  <TableCell className="text-right">{formatNumber(creative.conversions)}</TableCell>
                  <TableCell className="text-right">{formatCurrency(creative.spend)}</TableCell>
                  <TableCell className="text-right">
                    <div className="flex items-center justify-end space-x-1">
                      {formatPercentage(creative.ctr)}
                      {creative.ctr > 6.5 ? (
                        <TrendingUp className="h-3 w-3 text-green-600" />
                      ) : (
                        <TrendingDown className="h-3 w-3 text-red-600" />
                      )}
                    </div>
                  </TableCell>
                  <TableCell className="text-right">{formatPercentage(creative.cvr)}</TableCell>
                  <TableCell className="text-right">
                    <div className="flex items-center justify-end space-x-1">
                      {formatCurrency(creative.cpa)}
                      {creative.cpa < 7.0 ? (
                        <TrendingUp className="h-3 w-3 text-green-600" />
                      ) : (
                        <TrendingDown className="h-3 w-3 text-red-600" />
                      )}
                    </div>
                  </TableCell>
                  <TableCell className="text-right">{creative.cpv ? formatCurrency(creative.cpv) : "N/A"}</TableCell>
                  <TableCell className="text-right">
                    <span className={`font-medium ${creative.qualityScore > 2.5 ? "text-green-600" : "text-red-600"}`}>
                      {creative.qualityScore.toFixed(2)}
                    </span>
                  </TableCell>
                  <TableCell>
                    <DropdownMenu>
                      <DropdownMenuTrigger asChild>
                        <Button variant="ghost" className="h-8 w-8 p-0 hover:bg-primary/10">
                          <span className="sr-only">Open menu</span>
                          <MoreHorizontal className="h-4 w-4 text-primary" />
                        </Button>
                      </DropdownMenuTrigger>
                      <DropdownMenuContent align="end" className="border-primary/20">
                        <DropdownMenuLabel className="text-primary">Actions</DropdownMenuLabel>
                        <DropdownMenuItem className="hover:bg-primary/10">
                          <ExternalLink className="mr-2 h-4 w-4" />
                          View Creative
                        </DropdownMenuItem>
                        <DropdownMenuSeparator />
                        <DropdownMenuItem className="hover:bg-primary/10">Pause Creative</DropdownMenuItem>
                        <DropdownMenuItem className="hover:bg-primary/10">Duplicate Creative</DropdownMenuItem>
                      </DropdownMenuContent>
                    </DropdownMenu>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </div>
      </CardContent>
    </Card>
  )
}
