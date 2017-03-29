##########################################################################
# Copyright 2016 ThoughtWorks, Inc.
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

require 'capybara/dsl'
require 'rest-client'

module APIs
  class APIBase
    include Helpers
    include Context


    GET_TEMPLATE_URL =   http_url('/api/admin/templates')
    CREATE_TEMPLATE_URL = http_url('/api/admin/templates')

  def get(url, headers)
    response= RestClient.get(url,headers)
    rescue => e
      raise "Get template API call failed Error message #{e.reponse.body}"
end

    def post(url, payload, headers)
      response = RestClient.post(url, payload, headers)
    rescue => e
      raise "Create Template API call failed. Error message #{e.reponse.body}"
    end


  end
end
