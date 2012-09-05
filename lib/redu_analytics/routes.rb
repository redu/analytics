Rails.application.routes.draw do
  match '/analytics/dashboard', :to => 'analytics_dashboard#dashboard'
  match '/analytics/signup_by_date', :to => 'analytics_dashboard#signup_by_date'
  match '/analytics/environment_by_date', :to => 'analytics_dashboard#environment_by_date'
  match '/analytics/course_by_date', :to => 'analytics_dashboard#course_by_date'
  match '/analytics/post_by_date', :to => 'analytics_dashboard#post_by_date'
end
