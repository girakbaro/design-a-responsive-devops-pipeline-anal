import Foundation
import PlaygroundSupport

// DevOps Pipeline Analyzer

// Define a struct for Pipeline Stage
struct PipelineStage {
    let name: String
    let duration: TimeInterval
    let outcome: Bool
}

// Define a struct for DevOps Pipeline
struct DevOpsPipeline {
    let stages: [PipelineStage]
    let pipelineName: String
    
    init(stages: [PipelineStage], pipelineName: String) {
        self.stages = stages
        self.pipelineName = pipelineName
    }
    
    func analyze() -> String {
        var totalTime: TimeInterval = 0
        var successCount: Int = 0
        
        for stage in stages {
            totalTime += stage.duration
            if stage.outcome {
                successCount += 1
            }
        }
        
        let successRate = Double(successCount) / Double(stages.count)
        let summary = "\(pipelineName) pipeline analysis:\nTotal duration: \(totalTime) seconds\nSuccess rate: \(successRate)%"
        
        return summary
    }
}

// Define a class for Responsive DevOps Pipeline Analyzer
class ResponsiveDevOpsPipelineAnalyzer {
    let pipeline: DevOpsPipeline
    var displayWidth: Int
    
    init(pipeline: DevOpsPipeline, displayWidth: Int) {
        self.pipeline = pipeline
        self.displayWidth = displayWidth
    }
    
    func render() -> String {
        let summary = pipeline.analyze()
        let padding = String(repeating: " ", count: (displayWidth - summary.count) / 2)
        let renderedSummary = "\(padding)\(summary)\(padding)"
        
        return renderedSummary
    }
}

// Example usage
let stage1 = PipelineStage(name: "Build", duration: 30, outcome: true)
let stage2 = PipelineStage(name: "Test", duration: 60, outcome: false)
let stage3 = PipelineStage(name: "Deploy", duration: 90, outcome: true)

let pipeline = DevOpsPipeline(stages: [stage1, stage2, stage3], pipelineName: "MyPipeline")
let analyzer = ResponsiveDevOpsPipelineAnalyzer(pipeline: pipeline, displayWidth: 80)

print(analyzer.render())