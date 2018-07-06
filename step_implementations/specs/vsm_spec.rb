##########################################################################
# Copyright 2018 ThoughtWorks, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##########################################################################

step 'Verify pipelines <pipeline_list> are shown as upstreams' do |pipeline_list|
  pipeline_list.split(',').each { |pipeline| assert_true vsm_page.dependency_exists? pipeline.strip, scenario_state
                                                                                                         .self_pipeline }
end

step 'Click on pipeline stage bar - On VSM Page' do
  vsm_page.click_on_stage_of scenario_state.self_pipeline
end


