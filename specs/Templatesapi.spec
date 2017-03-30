TemplatesAPIs
=================

TemplatesAPIs
-------------------
tags: template_apis

Setup of contexts
* Template apis Configuration - setup
* Using pipeline "simple-upstream" - setup
* With "1" live agents - setup
* Capture go state "TemplatesAPIs" - setup


* Create a template "T2"
* For template "T2" update stage "1" job "1" name as "build_and_test"
* For template "T1" update stage "1" name as "build"
* Get all templates
* Verify template "T1" stage "1" name is "build"
* Verify template "T2" stage "1" job "1" name is "build_and_test"


teardown
_______________
* Capture go state "TemplatesAPIs" - teardown
* With "1" live agents - teardown
