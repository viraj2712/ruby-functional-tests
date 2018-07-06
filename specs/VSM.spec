VSM
=========

VSM
-------------------
tags: VSM

Setup of contexts
* VSM Basic Configuration - setup
* Using pipeline "PipelineA, PipelineB, PipelineC, PipelineD, Building-pipeline, Failing-pipeline" - setup
* With "1" live agents - setup
* Capture go state "VSM" - setup

* Looking at pipeline "PipelineA"
* Trigger pipeline - On Swift Dashboard page
* Wait till pipeline completed
* Verify stage "defaultStage" is "Passed"

* Looking at pipeline "PipelineB"
* Wait till pipeline completed
* Verify stage "defaultStage" is "Passed"

* Looking at pipeline "PipelineC"
* Wait till pipeline completed
* Verify stage "defaultStage" is "Passed"

* Looking at pipeline "PipelineD"
* Wait till pipeline completed
* Verify stage "defaultStage" is "Passed"


* Visit pipeline VSM page and verify VSM is rendered
* Verify pipelines "PipelineA, PipelineB, PipelineC" are shown as upstreams of "PipelineD"

* Click on pipeline stage bar - On VSM Page
* Verify stage details page is displayed

* On Swift Dashboard Page
* Looking at pipeline "Building-pipeline" - On Swift Dashboard page
* Trigger pipeline - On Swift Dashboard page
* Verify stage "defaultStage" is "Building" - On Swift Dashboard page
* Visit pipeline VSM page and verify VSM is rendered
* Click on pipeline stage bar - On VSM Page
* Verify stage details page is displayed

* On Swift Dashboard Page
* Create a "stopjob" file and validate pipeline completed

* On Swift Dashboard Page
* Looking at pipeline "Failing-pipeline" - On Swift Dashboard page
* Trigger pipeline - On Swift Dashboard page
* Verify stage "defaultStage" is "Failing" - On Swift Dashboard page
* Visit pipeline VSM page and verify VSM is rendered
* Click on pipeline stage bar - On VSM Page
* Verify stage details page is displayed
* On Swift Dashboard Page
* Create a "stopjob" file and validate pipeline completed



teardown
_______________
* Capture go state "VSM" - teardown
* With "1" live agents - teardown
