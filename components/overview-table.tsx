"use client"
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

const overviewData = [
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
  {
    id: "CR002",
    name: "Cashback_bof_presentor",
    platform: "YouTube",
    funnelStage: "Conversion",
    audienceType: "Remarketing",
    product: "Credit Cards",
    format: "Video",
    videoLength: "15s",
    presenter: true,
    cta: "Get Cashback",
    deviceType: "Desktop",
    placement: "In-stream",
    impressions: 890000,
    clicks: 62000,
    conversions: 980,
    spend: 6200,
    views: 720000,
    ctr: 6.97,
    cvr: 1.58,
    cpa: 6.33,
    cpv: 0.0086,
    qualityScore: 3.12,
    imageUrl: "/placeholder.svg?height=60&width=100",
  },
  {
    id: "CR003",
    name: "Benefits_Static_NoPresenter_Mobile",
    platform: "DV360",
    funnelStage: "Mid",
    audienceType: "Lookalike",
    product: "Benefits",
    format: "Static",
    videoLength: null,
    presenter: false,
    cta: "Learn More",
    deviceType: "Mobile",
    placement: "Native",
    impressions: 2100000,
    clicks: 126000,
    conversions: 1580,
    spend: 12400,
    views: null,
    ctr: 6.0,
    cvr: 1.25,
    cpa: 7.85,
    cpv: null,
    qualityScore: 2.45,
    imageUrl: "/placeholder.svg?height=60&width=100",
  },
  {
    id: "CR004",
    name: "B2B_Corporate_Solutions",
    platform: "Facebook",
    funnelStage: "Awareness",
    audienceType: "Prospecting",
    product: "B2B",
    format: "Video",
    videoLength: "45s",
    presenter: false,
    cta: "Contact Sales",
    deviceType: "Desktop",
    placement: "Stories",
    impressions: 750000,
    clicks: 45000,
    conversions: 680,
    spend: 5200,
    views: 580000,
    ctr: 6.0,
    cvr: 1.51,
    cpa: 7.65,
    cpv: 0.009,
    qualityScore: 2.18,
    imageUrl: "/placeholder.svg?height=60&width=100",
  },
  {
    id: "CR005",
    name: "Benefits_Mobile_CTA_Active",
    platform: "DV360",
    funnelStage: "Mid",
    audienceType: "Lookalike",
    product: "Benefits",
    format: "Static",
    videoLength: null,
    presenter: false,
    cta: "Learn More",
    deviceType: "Mobile",
    placement: "Native",
    impressions: 1850000,
    clicks: 111000,
    conversions: 1390,
    spend: 10900,
    views: null,
    ctr: 6.0,
    cvr: 1.25,
    cpa: 7.84,
    cpv: null,
    qualityScore: 2.65,
    imageUrl: "/placeholder.svg?height=60&width=100",
  },
]

export function OverviewTable() {
  const formatNumber = (num: number) => {
    if (num >= 1000000) return `${(num / 1000000).toFixed(1)}M`
    if (num >= 1000) return `${(num / 1000).toFixed(1)}K`
    return num.toString()
  }

  const formatCurrency = (num: number) => `$${num.toFixed(2)}`
  const formatPercentage = (num: number) => `${num.toFixed(2)}%`

  // Sort by quality score (highest first) and take top 5
  const sortedData = [...overviewData].sort((a, b) => b.qualityScore - a.qualityScore).slice(0, 5)

  return (
    <Card className="border-primary/20">
      <CardHeader>
        <CardTitle className="text-primary">Top Performing Creatives - Overview</CardTitle>
        <CardDescription>Top 5 creatives sorted by Quality Score (highest first)</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="rounded-md border border-primary/20 overflow-x-auto">
          <div className="min-w-[1600px]">
            <Table>
              <TableHeader>
                <TableRow className="bg-primary/5">
                  <TableHead className="text-primary font-semibold sticky left-0 bg-white z-10 border-r border-primary/20">
                    Creative
                  </TableHead>
                  <TableHead className="text-primary font-semibold sticky left-[280px] bg-white z-10 border-r border-primary/20">
                    Platform
                  </TableHead>
                  <TableHead className="text-primary font-semibold sticky left-[380px] bg-white z-10 border-r border-primary/20">
                    Product
                  </TableHead>
                  <TableHead className="text-primary font-semibold sticky left-[480px] bg-white z-10 border-r border-primary/20">
                    Funnel Stage
                  </TableHead>
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
                    <TableCell className="font-medium sticky left-0 bg-white z-10 border-r border-primary/20">
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
                    <TableCell className="sticky left-[280px] bg-white z-10 border-r border-primary/20">
                      <Badge variant="outline" className="border-primary text-primary">
                        {creative.platform}
                      </Badge>
                    </TableCell>
                    <TableCell className="sticky left-[380px] bg-white z-10 border-r border-primary/20">
                      <Badge variant="secondary" className="bg-secondary/10 text-secondary border-secondary">
                        {creative.product}
                      </Badge>
                    </TableCell>
                    <TableCell className="sticky left-[480px] bg-white z-10 border-r border-primary/20">
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
                      <span className={`font-bold ${creative.qualityScore > 2.5 ? "text-green-600" : "text-red-600"}`}>
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
        </div>
      </CardContent>
    </Card>
  )
}
