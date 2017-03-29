##########################################################################
# Copyright 2016 ThoughtWorks, Inc.
#
# Licensed under the Apache License, Version 2.0 (the License);
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an AS IS BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##########################################################################

require 'json'
require 'json_builder'
require 'deep_merge'

module Context
  class Configuration

    def default
      {}
    end

    attr_reader :data

    def initialize(args = {})
      @data = default.deep_merge!(args)
      @data.each do |k, v|
        instance_variable_set("@#{k}", v)
        self.class.send(:attr_reader, k)
      end
      yield self if block_given?
    end

    def <<(instance)
      if instance.is_a? EnvironmentVariable
        self.environment_variables << instance.data
      elsif instance.is_a? Parameter
        self.params << instance.data
      end
    end
  end


  class Template < Configuration
    def default
      {
          name: nil,
          stages: []
      }
    end

    def <<(instance)
      super(instance)
      self.stages << instance.data if instance.is_a? Stage
    end

    def to_json
      template = self

      JSONBuilder::Compiler.generate do
        name template.name
        stages template.stages
      end
    end
  end


  class Stage < Configuration
    def default
      {
          name: '',
          approval: {
              type: 'manual',
              authorization: {
                  roles: [],
                  users: []
              }
          },
          clean_working_directory: false,
          environment_variables: [],
          fetch_materials: true,
          jobs: [],
          never_cleanup_artifacts: false
      }
    end

    def <<(instance)
      super(instance)
      self.jobs << instance.data if instance.is_a? Job
    end
  end

  class Job < Configuration
    def default
      {
          name: '',
          artifacts: [],
          environment_variables: [],
          properties: nil,
          resources: [],
          run_count_instance: nil,
          tabs: [],
          tasks: [],
          timeout: 0
      }
    end

    def <<(instance)
      super(instance)
      self.tasks << instance.data if instance.is_a? Task
    end
  end

  class Task < Configuration;
  end
  class ExecTask < Task
    def default
      {
          type: 'exec',
      }
    end

    def initialize(args)
      super(args)
    end
  end
end
