module ReduAnalytics
  class Analytics
    def self.count_by_date(klass, start_date=1.year.ago.to_date, end_date=Date.today)
      all_days = (start_date..end_date).inject({}) { |acc, date| acc[date] = 0; acc }
      klass.select("id, created_at").all.each do |user|
        date = user.created_at.to_date
        if date && all_days.has_key?(date)
          all_days[date] += 1
        end
      end

      all_days.to_a.sort
    end

    def self.environment_mean_by_user
      by_user = User.select("id").collect { |u| u.environments_owned.count }
      by_user.sum / by_user.length.to_f
    end

    def self.course_mean_by_user
      by_user = User.select("id").collect { |u| u.courses_owned.count }
      by_user.sum / by_user.length.to_f
    end

    def self.members_mean_by_course
      members_by_course = Course.select("id").collect { |u| u.users.count }
      members_by_course.sum / members_by_course.length.to_f
    end

    def self.members_mean_by_environment
      members_by_environment = Environment.select("id").collect { |u| u.users.count }
      members_by_environment.sum / members_by_environment.length.to_f
    end

    def self.method_missing(name, *args, &block)
      if name.to_s =~ /^count_(\w+)_by_date$/
        count_by_date($1.camelize.constantize.all, *args)
      else
        raise NoMethodError
      end
    end
  end
end
