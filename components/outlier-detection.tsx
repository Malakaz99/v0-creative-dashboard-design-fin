"use client"

import { AlertTriangle, TrendingUp, TrendingDown } from "lucide-react"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Alert, AlertDescription, AlertTitle } from "@/components/ui/alert"

const outliers = [
  {
    id: "CR045",
    name: "B2B_Corporate_Video_60s_NoPresenter",
    platform: "Facebook",
    issue: "High CPA",
    currentCpa: 15.85,
    benchmarkCpa: 7.2,
    variance: "+120%",
    severity: "high",
    recommendation: "Pause creative and analyze messaging",
    spend: 2400,
    product: "B2B",
    qualityScore: 1.85,
  },
  {
    id: "CR023",
    name: "creative_loans_may25_static",
    platform: "YouTube",
    issue: "Low CTR",
    currentCtr: 2.1,
    benchmarkCtr: 6.8,
    variance: "-69%",
    severity: "medium",
    recommendation: "Test new creative variations",
    spend: 1800,
    product: "Loans",
    qualityScore: 2.12,
  },
  {
    id: "CR067",
    name: "Benefits_GIF_Presenter_Desktop",
    platform: "DV360",
    issue: "Budget Waste",
    currentCpa: 12.45,
    benchmarkCpa: 7.85,
    variance: "+59%",
    severity: "high",
    recommendation: "Reduce budget allocation",
    spend: 3200,
    product: "Benefits",
    qualityScore: 1.95,
  },
]

const topPerformers = [
  {
    id: "CR012",
    name: "Cashback_bof_presentor",
    platform: "Facebook",
    metric: "CPA",
    value: 4.85,
    benchmark: 7.2,
    variance: "-33%",
    spend: 5600,
    product: "Credit Cards",
    qualityScore: 3.45,
  },
  {
    id: "CR034",
    name: "creative_loans_may25",
    platform: "YouTube",
    metric: "CTR",
    value: 9.2,
    benchmark: 6.8,
    variance: "+35%",
    spend: 4200,
    product: "Loans",
    qualityScore: 3.12,
  },
]

export function OutlierDetection() {
  return (
    <div className="space-y-6">
      <Alert className="border-secondary bg-secondary/5">
        <AlertTriangle className="h-4 w-4 text-secondary" />
        <AlertTitle className="text-secondary">Performance Alerts</AlertTitle>
        <AlertDescription>
          3 creatives detected with significant performance issues requiring immediate attention. Estimated monthly
          waste: $7,400
        </AlertDescription>
      </Alert>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <Card className="border-red-200 bg-red-50/50">
          <CardHeader>
            <CardTitle className="flex items-center space-x-2">
              <TrendingDown className="h-5 w-5 text-red-600" />
              <span className="text-red-700">Underperforming Creatives</span>
            </CardTitle>
            <CardDescription>Creatives with performance significantly below benchmarks</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {outliers.map((outlier) => (
                <div key={outlier.id} className="border border-red-200 rounded-lg p-4 space-y-3 bg-white">
                  <div className="flex items-center justify-between">
                    <div>
                      <div className="font-medium text-sm text-primary">{outlier.id}</div>
                      <div className="text-xs text-muted-foreground max-w-[200px] truncate">{outlier.name}</div>
                    </div>
                    <div className="flex items-center space-x-2">
                      <Badge variant="outline" className="border-primary text-primary">
                        {outlier.platform}
                      </Badge>
                      <Badge variant="secondary" className="bg-secondary/10 text-secondary border-secondary">
                        {outlier.product}
                      </Badge>
                      <Badge variant={outlier.severity === "high" ? "destructive" : "secondary"}>
                        {outlier.severity}
                      </Badge>
                    </div>
                  </div>

                  <div className="grid grid-cols-2 gap-4 text-sm">
                    <div>
                      <span className="text-muted-foreground">Issue: </span>
                      <span className="font-medium">{outlier.issue}</span>
                    </div>
                    <div>
                      <span className="text-muted-foreground">Variance: </span>
                      <span className="font-medium text-red-600">{outlier.variance}</span>
                    </div>
                    <div>
                      <span className="text-muted-foreground">Spend: </span>
                      <span className="font-medium">${outlier.spend}</span>
                    </div>
                    <div>
                      <span className="text-muted-foreground">Quality Score: </span>
                      <span className="font-medium text-red-600">{outlier.qualityScore.toFixed(2)}</span>
                    </div>
                  </div>

                  <div className="text-sm">
                    <span className="text-muted-foreground">Recommendation: </span>
                    <span>{outlier.recommendation}</span>
                  </div>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        <Card className="border-green-200 bg-green-50/50">
          <CardHeader>
            <CardTitle className="flex items-center space-x-2">
              <TrendingUp className="h-5 w-5 text-green-600" />
              <span className="text-green-700">Top Performers</span>
            </CardTitle>
            <CardDescription>Creatives significantly outperforming benchmarks</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {topPerformers.map((performer) => (
                <div key={performer.id} className="border border-green-200 rounded-lg p-4 space-y-3 bg-white">
                  <div className="flex items-center justify-between">
                    <div>
                      <div className="font-medium text-sm text-primary">{performer.id}</div>
                      <div className="text-xs text-muted-foreground max-w-[200px] truncate">{performer.name}</div>
                    </div>
                    <div className="flex items-center space-x-2">
                      <Badge variant="outline" className="border-primary text-primary">
                        {performer.platform}
                      </Badge>
                      <Badge variant="secondary" className="bg-secondary/10 text-secondary border-secondary">
                        {performer.product}
                      </Badge>
                      <Badge variant="default" className="bg-green-600 text-white">
                        Top Performer
                      </Badge>
                    </div>
                  </div>

                  <div className="grid grid-cols-2 gap-4 text-sm">
                    <div>
                      <span className="text-muted-foreground">Metric: </span>
                      <span className="font-medium">{performer.metric}</span>
                    </div>
                    <div>
                      <span className="text-muted-foreground">Improvement: </span>
                      <span className="font-medium text-green-600">{performer.variance}</span>
                    </div>
                    <div>
                      <span className="text-muted-foreground">Value: </span>
                      <span className="font-medium">{performer.value}</span>
                    </div>
                    <div>
                      <span className="text-muted-foreground">Quality Score: </span>
                      <span className="font-medium text-green-600">{performer.qualityScore.toFixed(2)}</span>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
