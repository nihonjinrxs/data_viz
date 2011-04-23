# require 'googlevisualr'

class ApplicationController < ActionController::Base
  protect_from_forgery
end

def pie_chart
  # Create a PieChart visualization
  @chart = GoogleVisualr::PieChart.new
  
  # Add Column Headers
  @chart.add_column('string', 'Task')
  @chart.add_column('number', 'Hours per Day')
  
  # Add Number of Rows and Row Values
  @chart.add_rows([
    ['Work'     , 11],
    ['Eat'      ,  2],
    ['Commute'  ,  2],
    ['Watch TV' ,  2],
    ['Sleep'    ,  7]
  ]);
  
  # Set Configuration Options for PieChart
  options = { :width => 400, :height => 240,
              :title => 'My Daily Activities', :is3D => true }
  options.each_pair do | key, value |
    @chart.send "#{key}=", value
  end
  
end
