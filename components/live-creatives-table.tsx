"use client"

import { useState } from "react"
import { MoreHorizontal, ExternalLink, TrendingUp, TrendingDown, Play, Pause } from "lucide-react"
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
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"

const liveCreativesData = [
  {
    id: "CR001",
    name: "creative_loans_may25",
    platform: "Facebook",
    product: "Loans",
    campaignStatus: "Active",
    startDate: "2024-05-15",
    dailySpend: 1250,
    dailyImpressions: 185000,
    currentCtr: 7.2,
    currentCvr: 1.65,
    qualityScore: 3.15,
    imageUrl: "/placeholder.svg?height=60&width=100&text=Video",
    format: "Video",
    videoLength: "30s",
  },
  {
    id: "CR002",
    name: "Cashback_bof_presentor",
    platform: "YouTube",
    product: "Credit Cards",
    campaignStatus: "Active",
    startDate: "2024-05-12",
    dailySpend: 980,
    dailyImpressions: 142000,
    currentCtr: 8.1,
    currentCvr: 1.82,
    qualityScore: 3.45,
    imageUrl: "/placeholder.svg?height=60&width=100&text=Video",
    format: "Video",
    videoLength: "15s",
  },
  {
    id: "CR005",
    name: "Benefits_Mobile_CTA_Active",
    platform: "DV360",
    product: "Benefits",
    campaignStatus: "Live",
    startDate: "2024-05-18",
    dailySpend: 750,
    dailyImpressions: 95000,
    currentCtr: 6.8,
    currentCvr: 1.45,
    qualityScore: 2.95,
    imageUrl: "/placeholder.svg?height=60&width=100&text=Static",
    format: "Static",
    videoLength: null,
  },
  {
    id: "CR007",
    name: "B2B_Corporate_Live_Campaign",
    platform: "Facebook",
    product: "B2B",
    campaignStatus: "Active",
    startDate: "2024-05-20",
    dailySpend: 650,
    dailyImpressions: 78000,
    currentCtr: 5.9,
    currentCvr: 1.28,
    qualityScore: 2.65,
    imageUrl: "/placeholder.svg?height=60&width=100&text=Video",
    format: "Video",
    videoLength: "45s",
  },
  {
    id: "CR009",
    name: "Loans_Remarketing_Active",
    platform: "YouTube",
    product: "Loans",
    campaignStatus: "Live",
    startDate: "2024-05-22",
    dailySpend: 1100,
    dailyImpressions: 165000,
    currentCtr: 7.8,
    currentCvr: 1.72,
    qualityScore: 3.28,
    imageUrl: "/placeholder.svg?height=60&width=100&text=Video",
    format: "Video",
    videoLength: "20s",
  },
  {
    id: "CR010",
    name: "GIF_Remarketing_Campaign",
    platform: "DV360",
    product: "Loans",
    campaignStatus: "Active",
    startDate: "2024-05-25",
    dailySpend: 800,
    dailyImpressions: 110000,
    currentCtr: 6.5,
    currentCvr: 1.35,
    qualityScore: 2.85,
    imageUrl: "/placeholder.svg?height=60&width=100&text=GIF",
    format: "GIF",
    videoLength: null,
  },
]

export function LiveCreativesTable() {
  const [platformFilter, setPlatformFilter] = useState("all")
  const [productFilter, setProductFilter] = useState("all")
  const [campaignFilter, setCampaignFilter] = useState("all")

  const formatNumber = (num: number) => {
    if (num >= 1000000) return `${(num / 1000000).toFixed(1)}M`
    if (num >= 1000) return `${(num / 1000).toFixed(1)}K`
    return num.toString()
  }

  const formatCurrency = (num: number) => `$${num.toFixed(0)}`
  const formatPercentage = (num: number) => `${num.toFixed(2)}%`

  // Sort by daily spend (highest first) by default
  const sortedData = [...liveCreativesData].sort((a, b) => b.dailySpend - a.dailySpend)

  return (
    <div className="space-y-6">
      {/* Live Status Alert */}
      <Card className="border-green-200 bg-green-50/50">
        <CardContent className="pt-6">
          <div className="flex items-center space-x-2">
            <div className="w-3 h-3 bg-green-500 rounded-full animate-pulse"></div>
            <span className="text-green-700 font-medium">
              {liveCreativesData.length} Active Campaigns Running | Total Daily Spend: $
              {liveCreativesData.reduce((sum, item) => sum + item.dailySpend, 0).toLocaleString()}
            </span>
          </div>
        </CardContent>
      </Card>

      {/* Filters for Live Creatives */}
      <Card className="border-primary/20">
        <CardHeader>
          <CardTitle className="text-primary">Live Campaign Filters</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div className="space-y-2">
              <label className="text-sm font-medium">Platform</label>
              <Select value={platformFilter} onValueChange={setPlatformFilter}>
                <SelectTrigger className="border-primary/30 focus:border-primary">
                  <SelectValue placeholder="All Platforms" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Platforms</SelectItem>
                  <SelectItem value="facebook">Facebook</SelectItem>
                  <SelectItem value="youtube">YouTube</SelectItem>
                  <SelectItem value="dv360">DV360</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div className="space-y-2">
              <label className="text-sm font-medium">Product</label>
              <Select value={productFilter} onValueChange={setProductFilter}>
                <SelectTrigger className="border-primary/30 focus:border-primary">
                  <SelectValue placeholder="All Products" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Products</SelectItem>
                  <SelectItem value="loans">Loans</SelectItem>
                  <SelectItem value="creditcards">Credit Cards</SelectItem>
                  <SelectItem value="benefits">Benefits</SelectItem>
                  <SelectItem value="b2b">B2B</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div className="space-y-2">
              <label className="text-sm font-medium">Campaign Status</label>
              <Select value={campaignFilter} onValueChange={setCampaignFilter}>
                <SelectTrigger className="border-primary/30 focus:border-primary">
                  <SelectValue placeholder="All Statuses" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Statuses</SelectItem>
                  <SelectItem value="active">Active</SelectItem>
                  <SelectItem value="live">Live</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Live Creatives Table */}
      <Card className="border-primary/20">
        <CardHeader>
          <CardTitle className="text-primary flex items-center space-x-2">
            <Play className="h-5 w-5 text-green-600" />
            <span>Live Creatives - Real-Time Performance</span>
          </CardTitle>
          <CardDescription>Currently active campaigns sorted by daily spend (highest first)</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="rounded-md border border-primary/20">
            <Table>
              <TableHeader>
                <TableRow className="bg-primary/5">
                  <TableHead className="text-primary font-semibold">Creative</TableHead>
                  <TableHead className="text-primary font-semibold">Platform</TableHead>
                  <TableHead className="text-primary font-semibold">Product</TableHead>
                  <TableHead className="text-primary font-semibold">Status</TableHead>
                  <TableHead className="text-primary font-semibold">Start Date</TableHead>
                  <TableHead className="text-right text-primary font-semibold">Daily Spend</TableHead>
                  <TableHead className="text-right text-primary font-semibold">Daily Impressions</TableHead>
                  <TableHead className="text-right text-primary font-semibold">Current CTR</TableHead>
                  <TableHead className="text-right text-primary font-semibold">Current CVR</TableHead>
                  <TableHead className="text-right text-primary font-semibold">Quality Score</TableHead>
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
                            <>
                              <div className="absolute inset-0 flex items-center justify-center">
                                <Play className="h-6 w-6 text-white opacity-75" />
                              </div>
                              <div className="absolute bottom-0 right-0 bg-primary bg-opacity-90 text-white text-xs px-1 rounded-tl">
                                {creative.videoLength}
                              </div>
                            </>
                          )}
                          {creative.format === "GIF" && (
                            <div className="absolute top-0 left-0 bg-primary bg-opacity-90 text-white text-xs px-1 rounded-br">
                              GIF
                            </div>
                          )}
                          <div className="absolute top-0 left-0 w-2 h-2 bg-green-500 rounded-full animate-pulse"></div>
                        </div>
                        <div>
                          <div className="font-medium text-sm text-primary">{creative.id}</div>
                          <div className="text-xs text-muted-foreground max-w-[200px] truncate">{creative.name}</div>
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
                        variant="default"
                        className={
                          creative.campaignStatus === "Active" ? "bg-green-600 text-white" : "bg-blue-600 text-white"
                        }
                      >
                        <div className="flex items-center space-x-1">
                          <div className="w-2 h-2 bg-white rounded-full animate-pulse"></div>
                          <span>{creative.campaignStatus}</span>
                        </div>
                      </Badge>
                    </TableCell>
                    <TableCell className="text-sm">{creative.startDate}</TableCell>
                    <TableCell className="text-right">
                      <div className="flex items-center justify-end space-x-1">
                        <span className="font-bold text-primary">{formatCurrency(creative.dailySpend)}</span>
                        {creative.dailySpend > 1000 ? (
                          <TrendingUp className="h-3 w-3 text-green-600" />
                        ) : (
                          <TrendingDown className="h-3 w-3 text-orange-600" />
                        )}
                      </div>
                    </TableCell>
                    <TableCell className="text-right font-medium">{formatNumber(creative.dailyImpressions)}</TableCell>
                    <TableCell className="text-right">
                      <div className="flex items-center justify-end space-x-1">
                        {formatPercentage(creative.currentCtr)}
                        {creative.currentCtr > 7.0 ? (
                          <TrendingUp className="h-3 w-3 text-green-600" />
                        ) : (
                          <TrendingDown className="h-3 w-3 text-red-600" />
                        )}
                      </div>
                    </TableCell>
                    <TableCell className="text-right">{formatPercentage(creative.currentCvr)}</TableCell>
                    <TableCell className="text-right">
                      <span
                        className={`font-bold ${creative.qualityScore > 3.0 ? "text-green-600" : creative.qualityScore > 2.5 ? "text-orange-600" : "text-red-600"}`}
                      >
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
                          <DropdownMenuLabel className="text-primary">Campaign Actions</DropdownMenuLabel>
                          <DropdownMenuItem className="hover:bg-primary/10">
                            <ExternalLink className="mr-2 h-4 w-4" />
                            View Live Performance
                          </DropdownMenuItem>
                          <DropdownMenuSeparator />
                          <DropdownMenuItem className="hover:bg-primary/10">
                            <Pause className="mr-2 h-4 w-4" />
                            Pause Campaign
                          </DropdownMenuItem>
                          <DropdownMenuItem className="hover:bg-primary/10">Adjust Budget</DropdownMenuItem>
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
    </div>
  )
}
