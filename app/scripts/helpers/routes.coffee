define ->

  class RoutesHelper
    @rootPath: -> '#'
    @allReports: -> '#all_reports'
    @reportPath: (id) -> "all_reports/#{id}"
    @createReport: -> '#create_report'
    @createTemplate: -> '#create_template'
