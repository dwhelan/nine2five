require 'spec_helper'

def initialize_workflow_map
   workflow_map.reset
end

def workflow_map
  Nine2Five::WorkflowMap.instance
end

def channels
  workflow_map.channels
end

def processors
  workflow_map.processors
end