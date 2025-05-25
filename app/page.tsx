"use client"

import { useState } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Button } from "@/components/ui/button"
import { DatePickerWithRange } from "@/components/date-range-picker"
import { OverviewMetrics } from "@/components/overview-metrics"
import { CreativePerformanceTable } from "@/components/creative-performance-table"
import { OverviewTable } from "@/components/overview-table"
import { LiveCreativesTable } from "@/components/live-creatives-table"
import { PlatformComparison } from "@/components/platform-comparison"
import { FunnelAnalysis } from "@/components/funnel-analysis"
import { CreativeAttributes } from "@/components/creative-attributes"
import { OutlierDetection } from "@/components/outlier-detection"

export default function CreativeDashboard() {
  const [selectedPlatform, setSelectedPlatform] = useState("all")
  const [selectedFunnelStage, setSelectedFunnelStage] = useState("all")
  const [selectedAudienceType, setSelectedAudienceType] = useState("all")

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto p-6 space-y-6">
        {/* Header with Isracard & M:ad Branding */}
        <div className="flex flex-col space-y-4 md:flex-row md:items-center md:justify-between md:space-y-0">
          <div className="flex items-center space-x-4">
            {/* Isracard Logo */}
            <div className="w-12 h-12 bg-primary rounded-lg flex items-center justify-center">
              <span className="text-white font-bold text-xl">I</span>
            </div>
            {/* M:ad Logo */}
            <div className="w-16 h-12 bg-white rounded-lg flex items-center justify-center border border-gray-200">
              <img src="/images/mad-logo.png" alt="M:ad Logo" className="h-8 w-auto object-contain" />
            </div>
            <div>
              <h1 className="text-3xl font-bold tracking-tight text-primary">
                Isracard - Creative Performance Dashboard | M:ad
              </h1>
              <p className="text-muted-foreground">Unified creative intelligence across all digital platforms</p>
            </div>
          </div>
          <div className="flex items-center space-x-2">
            <DatePickerWithRange />
            <Button variant="outline" className="border-primary text-primary hover:bg-primary hover:text-white">
              Export Report
            </Button>
          </div>
        </div>

        {/* Filters */}
        <Card className="border-primary/20">
          <CardHeader>
            <CardTitle className="text-lg text-primary">Filters</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
              <div className="space-y-2">
                <label className="text-sm font-medium">Brand</label>
                <Select>
                  <SelectTrigger className="border-primary/30 focus:border-primary">
                    <SelectValue placeholder="Select brand" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Brands</SelectItem>
                    <SelectItem value="isracard">Isracard</SelectItem>
                    <SelectItem value="americanexpress">American Express</SelectItem>
                  </SelectContent>
                </Select>
              </div>
              <div className="space-y-2">
                <label className="text-sm font-medium">Product</label>
                <Select>
                  <SelectTrigger className="border-primary/30 focus:border-primary">
                    <SelectValue placeholder="Select product" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Products</SelectItem>
                    <SelectItem value="loans">Loans</SelectItem>
                    <SelectItem value="creditcards">Credit Cards</SelectItem>
                    <SelectItem value="benefits">Benefits</SelectItem>
                    <SelectItem value="b2b">B2B</SelectItem>
                    <SelectItem value="other">Other</SelectItem>
                  </SelectContent>
                </Select>
              </div>
              <div className="space-y-2">
                <label className="text-sm font-medium">Platform</label>
                <Select value={selectedPlatform} onValueChange={setSelectedPlatform}>
                  <SelectTrigger className="border-primary/30 focus:border-primary">
                    <SelectValue placeholder="Select platform" />
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
                <label className="text-sm font-medium">Campaign</label>
                <Select>
                  <SelectTrigger className="border-primary/30 focus:border-primary">
                    <SelectValue placeholder="Select campaign" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Campaigns</SelectItem>
                    <SelectItem value="loans_q2_2024">Loans Q2 2024</SelectItem>
                    <SelectItem value="cashback_spring">Cashback Spring</SelectItem>
                    <SelectItem value="benefits_awareness">Benefits Awareness</SelectItem>
                  </SelectContent>
                </Select>
              </div>
            </div>
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4 mt-4">
              <div className="space-y-2">
                <label className="text-sm font-medium">Placement</label>
                <Select>
                  <SelectTrigger className="border-primary/30 focus:border-primary">
                    <SelectValue placeholder="Select placement" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Placements</SelectItem>
                    <SelectItem value="feed">Feed</SelectItem>
                    <SelectItem value="stories">Stories</SelectItem>
                    <SelectItem value="native">Native</SelectItem>
                    <SelectItem value="instream">In-stream</SelectItem>
                  </SelectContent>
                </Select>
              </div>
              <div className="space-y-2">
                <label className="text-sm font-medium">Ad Set</label>
                <Select>
                  <SelectTrigger className="border-primary/30 focus:border-primary">
                    <SelectValue placeholder="Select ad set" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Ad Sets</SelectItem>
                    <SelectItem value="prospecting_25_45">Prospecting 25-45</SelectItem>
                    <SelectItem value="remarketing_lookalike">Remarketing Lookalike</SelectItem>
                    <SelectItem value="high_income_segment">High Income Segment</SelectItem>
                  </SelectContent>
                </Select>
              </div>
              <div className="space-y-2">
                <label className="text-sm font-medium">Ad</label>
                <Select>
                  <SelectTrigger className="border-primary/30 focus:border-primary">
                    <SelectValue placeholder="Select ad" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Ads</SelectItem>
                    <SelectItem value="creative_loans_may25">creative_loans_may25</SelectItem>
                    <SelectItem value="cashback_bof_presentor">Cashback_bof_presentor</SelectItem>
                  </SelectContent>
                </Select>
              </div>
              <div className="space-y-2">
                <label className="text-sm font-medium">Funnel Stage</label>
                <Select value={selectedFunnelStage} onValueChange={setSelectedFunnelStage}>
                  <SelectTrigger className="border-primary/30 focus:border-primary">
                    <SelectValue placeholder="Select stage" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Stages</SelectItem>
                    <SelectItem value="awareness">Awareness</SelectItem>
                    <SelectItem value="mid">Mid-Funnel</SelectItem>
                    <SelectItem value="conversion">Conversion</SelectItem>
                  </SelectContent>
                </Select>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Overview Metrics */}
        <OverviewMetrics />

        {/* Main Dashboard Tabs */}
        <Tabs defaultValue="overview" className="space-y-6">
          <TabsList className="grid w-full grid-cols-7 bg-primary/10">
            <TabsTrigger value="overview" className="data-[state=active]:bg-primary data-[state=active]:text-white">
              Overview
            </TabsTrigger>
            <TabsTrigger value="live" className="data-[state=active]:bg-primary data-[state=active]:text-white">
              Live Creatives
            </TabsTrigger>
            <TabsTrigger value="performance" className="data-[state=active]:bg-primary data-[state=active]:text-white">
              Performance Table
            </TabsTrigger>
            <TabsTrigger value="platform" className="data-[state=active]:bg-primary data-[state=active]:text-white">
              Platform Analysis
            </TabsTrigger>
            <TabsTrigger value="funnel" className="data-[state=active]:bg-primary data-[state=active]:text-white">
              Funnel Analysis
            </TabsTrigger>
            <TabsTrigger value="creative" className="data-[state=active]:bg-primary data-[state=active]:text-white">
              Creative Attributes
            </TabsTrigger>
            <TabsTrigger value="outliers" className="data-[state=active]:bg-primary data-[state=active]:text-white">
              Outlier Detection
            </TabsTrigger>
          </TabsList>

          <TabsContent value="overview" className="space-y-6">
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
              <PlatformComparison />
              <FunnelAnalysis />
            </div>
            <OverviewTable />
          </TabsContent>

          <TabsContent value="live">
            <LiveCreativesTable />
          </TabsContent>

          <TabsContent value="performance">
            <CreativePerformanceTable />
          </TabsContent>

          <TabsContent value="platform">
            <PlatformComparison />
          </TabsContent>

          <TabsContent value="funnel">
            <FunnelAnalysis />
          </TabsContent>

          <TabsContent value="creative">
            <CreativeAttributes />
          </TabsContent>

          <TabsContent value="outliers">
            <OutlierDetection />
          </TabsContent>
        </Tabs>
      </div>
    </div>
  )
}
