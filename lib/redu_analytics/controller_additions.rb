require 'lazy_high_charts'

module ReduAnalytics
  module ControllerAdditions
    extend ActiveSupport::Concern

    included do
      before_filter :authenticate if ReduAnalytics::BasicAuthentication.enabled
    end

    def dashboard
      respond_to do |format|
        format.html { render :layout => 'clean' }
      end
    end

    def signup_by_date
      startd = Date.new(2011,02,05)
      endd = Date.today

      @by_signup = ReduAnalytics::Analytics.count_user_by_date(startd, endd)
      @graph = plot("cadastro por dia", "cadastros", @by_signup)

      respond_to  do |format|
        format.html { render :signup_by_date }
      end
    end

    def environment_by_date
      startd = Date.new(2011,02,05)
      endd = Date.today

      @data = ReduAnalytics::Analytics.count_environment_by_date(startd, endd)
      @graph = plot("criação de AVA por dia", "número de AVAs", @data)

      respond_to  do |format|
        format.html { render :signup_by_date }
      end
    end

    def course_by_date
      startd = Date.new(2011,02,05)
      endd = Date.today

      @data = ReduAnalytics::Analytics.count_course_by_date(startd, endd)
      @graph = plot("criação de Cursos por dia", "número de cursos", @data)

      respond_to  do |format|
        format.html { render :signup_by_date }
      end
    end

    def post_by_date
      startd = Date.new(2011,02,05)
      endd = Date.today

      @data = ReduAnalytics::Analytics.count_status_by_date(startd, endd)
      @graph = plot("Postagens  por dia", "número de posts", @data)

      respond_to  do |format|
        format.html { render :signup_by_date }
      end
    end


    private

    def plot(name, serie_name, data)
      LazyHighCharts::HighChart.new do |f|
        f.chart(:zoomType => 'x')
        f.title({:text => name})
        f.plotOptions({
          :area => {
            :lineWidth => 1,
            :shadow => false
          }
        })
        f.series(:name=>'Cadastros',
                 :type => 'area',
                 :pointInterval => 1.day * 1000,
                 :pointStart => data.first[0].to_time.to_i * 1000,
                 :data => data.collect(&:last).flatten)
      end

    end

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == ReduAnalytics::BasicAuthentication.username &&
          password == ReduAnalytics::BasicAuthentication.password
      end
    end
  end
end
