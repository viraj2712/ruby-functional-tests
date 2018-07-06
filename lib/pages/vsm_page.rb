##########################################################################
# Copyright 2017 ThoughtWorks, Inc.
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

module Pages
  class ValueStreamMap < AppBase
    set_url "#{GoConstants::GO_SERVER_BASE_URL}/pipelines/value_stream_map{/name}{/instance}"

    element :vsm_container,               "#vsm-container"


    def pipeline_instance(pipeline)
      vsm_container.find("##{pipeline}")
    end

    def click_on_stage_of(pipeline)
      pipeline_instance(pipeline).find('.instance').find('.stage_bar').click
    end

    def dependency_exists?(source, destination)
      vsm_container.has_css?('path', class: ".dependency.#{source}.#{destination}")
    end


  end
end
