class LeadSheet
  def self.draw(customer, job_site)
    require 'pdf/writer'
    require 'pdf/simpletable'

    pdf = PDF::Writer.new
    pdf.select_font "Times-Roman"
    pdf.image "#{Rails.root}/app/assets/images/banner.jpg", :resize => 0.5
    #pdf.text "LEAD SHEET" , :font_size => 20, :justification => :center, :leading => -10
    pdf.add_text(250, 720, "LEAD SHEET", size=20 )
    #pdf.line(pdf.absolute_left_margin, pdf.y + 2,
    #         pdf.absolute_right_margin, pdf.y + 2).stroke
    #pdf.top_margin = pdf.y + 20
    pdf.move_pointer(15)
    pdf.add_text(50, 670, "ESTIMATE REQUESTED BY", size=13 )
    pdf.move_to(220, 675).line_to(320, 675).line_to(320, 520).line_to(30, 520).line_to(30, 675).line_to(45,675).stroke
    pdf.add_text(45, 640, "Requested By ", size=12 )

    first_last_name_length = customer.first_name + " "+ customer.last_name
    pdf.add_text(130, 640, first_last_name_length, 11)

    pdf.add_text(45, 620, "Address:", 12)
    pdf.add_text(130, 620, customer.street1, 11)
    stateCityZip = customer.city+", " + customer.state + ", "+ customer.zip
    pdf.add_text(130, 600, stateCityZip, 11)

    pdf.add_text(45, 580, "Cell", 12)
    pdf.add_text(130, 580, customer.mobile_phone, 11)

    pdf.add_text(45, 560, "Email", 12)
    pdf.add_text(130, 560, customer.email, 12)


    pdf.add_text(360, 670, "PROPERTY INFORMATION", size=13 )
    pdf.move_to(530, 675).line_to(580, 675).line_to(580, 520).line_to(340, 520).line_to(340, 675).line_to(357,675).stroke

    pdf.add_text(355, 640, "Address:", 12)
    pdf.add_text(410, 640, job_site.street1, 11)
    stateCityZip = job_site.city+", " + job_site.state + ", "+ job_site.zip
    pdf.add_text(410, 620, stateCityZip, 11)

    pdf.add_text(355, 600, "Cell", 12)
    pdf.add_text(410, 600, job_site.mobile_phone, 11)
    #pdf.add_text(355, 580, "Email", 12)
    #pdf.add_text(410, 580, job_site.email, 12)

    pdf.add_text(50, 460, "REFERRAL INFORMATION", size=13 )
    pdf.move_to(215, 465).line_to(580, 465).line_to(580, 420).line_to(30, 420).line_to(30, 465).line_to(45,465).stroke
    pdf.add_text(45, 440, "Lead Source:", 12)
    if(customer.lead_source_id != nil)
      lead_source = LeadSource.find(customer.lead_source_id).source
      pdf.add_text(130, 440, lead_source, 12)
    end
    pdf.add_text(50, 370, "BUILDING INFORMATION", size=13 )
    pdf.move_to(215, 375).line_to(580, 375).line_to(580, 300).line_to(30, 300).line_to(30, 375).line_to(45,375).stroke
    pdf.add_text(45, 350, "Existing Roof Type:", 12)
    if(job_site.existing_roof_type_id != nil)
      existing_roof_type = RoofType.find(job_site.existing_roof_type_id).roof_type
      pdf.add_text(150, 350, existing_roof_type, 12)
    end

    pdf.add_text(45, 330, "How Many Storied:", 12)
    if(job_site.existing_roof_type_id != nil)
      pdf.add_text(150, 330, job_site.how_many_stories, 12)
    end

    pdf.add_text(45, 310, "Service Requested:", 12)
    job_service_types = JobServiceType.where("job_id" =>job_site.id)
    if(job_service_types != nil && job_service_types.size > 0)
      total_service_type = ""
      job_service_types.each do |job_service_type|
        total_service_type = total_service_type + ServiceType.find(job_service_type.service_type_id).service_type + " "
      end
      pdf.add_text(150, 310, total_service_type, 12)
    end

    pdf.move_to(30, 50).line_to(580, 50).line_to(580, 10).line_to(30, 10).line_to(30, 50).stroke
    pdf.move_to(250, 50).line_to(250, 10).stroke
    pdf.move_to(450, 50).line_to(450, 10).stroke

    pdf.add_text(45, 30, "Info Taken By:", 12)
    if(job_site.info_taken_by_id != nil)
      employee = Employee.find(job_site.info_taken_by_id)
      first_name = employee.first_name
      last_name = employee.last_name
      info_taken_by = first_name +" "+last_name
      pdf.add_text(125, 30, info_taken_by, 12)
    end

    pdf.add_text(260, 30, "Assigned To:", 12)
    if(job_site.info_taken_by_id != nil)
      employee = Employee.find(job_site.assign_to_id)
      first_name = employee.first_name
      last_name = employee.last_name
      assigned_to = first_name +" "+last_name
      pdf.add_text(330, 30, assigned_to, 12)
    end

    pdf.add_text(460, 30, "Date Taken:", 12)
    if(job_site.date_taken != nil)
      assigned_to = job_site.date_taken.strftime("%m/%d/%Y")
      pdf.add_text(520, 30, assigned_to, 12)
    end


    pdf.render
  end
end