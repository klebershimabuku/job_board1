# coding: utf-8
module JobsHelper

	def status_of(job)
		if job.expired?
			content_tag :div, "Expirado", :class => 'job_status job_status_expired'
		elsif job.available == true && job.locked == false
			content_tag(:div, "Online", :class => 'job_status job_status_online')
		else
			content_tag(:div,"Revisão", :class => 'job_status job_status_revision')
		end
	end
end
