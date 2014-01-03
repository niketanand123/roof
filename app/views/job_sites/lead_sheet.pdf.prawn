pdf.font "Times-Roman"

pdf.image "#{Rails.root}/app/assets/images/banner.jpg", :width => 180, :height => 60
pdf.draw_text "LEAD SHEET", :at => [230, 680], :size => 20, :style => :bold

pdf.draw_text "ESTIMATE REQUESTED BY", :at => [40, 600], :size => 13
pdf.stroke do
    pdf.horizontal_line(208, 265, :at => 605)
    pdf.vertical_line(605, 450, :at => 265)
    pdf.horizontal_line(10, 265, :at => 450)
    pdf.vertical_line(605, 450, :at => 10)
    pdf.horizontal_line(10, 35, :at => 605)
end
pdf.draw_text "Requested By", :at => [20, 570], :size => 12, :style => :bold
first_last_name = @customer.first_name + " "+ @customer.last_name
pdf.draw_text first_last_name, :at => [100, 570], :size => 11

pdf.draw_text "Address:", :at => [20, 550], :size => 12, :style => :bold
pdf.draw_text @customer.street1, :at => [100, 550], :size => 11
stateCityZip = @customer.city+", " + @customer.state + ", "+ @customer.zip
pdf.draw_text stateCityZip, :at => [100, 530], :size => 11

pdf.draw_text "Cell", :at => [20, 500], :size => 12, :style => :bold
pdf.draw_text @customer.mobile_phone, :at => [100, 500], :size => 11

pdf.draw_text "Email", :at => [20, 480], :size => 12, :style => :bold
pdf.draw_text @customer.email, :at => [100, 480], :size => 11


pdf.draw_text "PROPERTY INFORMATION", :at => [310, 600], :size => 13
pdf.stroke do
    pdf.horizontal_line(470, 520, :at => 605)
    pdf.vertical_line(605, 450, :at => 520)
    pdf.horizontal_line(300, 520, :at => 450)
    pdf.vertical_line(605, 450, :at => 300)
    pdf.horizontal_line(300, 310, :at => 605)
end

pdf.draw_text "Address:", :at => [310, 570], :size => 12, :style => :bold
pdf.draw_text @job_site.street1, :at => [370, 570], :size => 11
stateCityZip = @job_site.city+", " + @job_site.state + ", "+ @job_site.zip
pdf.draw_text stateCityZip, :at => [370, 550], :size => 11

pdf.draw_text "Cell", :at => [310, 520], :size => 12, :style => :bold
pdf.draw_text @job_site.mobile_phone, :at => [100, 520], :size => 11

pdf.draw_text "REFERRAL INFORMATION", :at => [40, 400], :size => 13
pdf.stroke do
    pdf.horizontal_line(210, 520, :at => 405)
    pdf.vertical_line(405, 350, :at => 520)
    pdf.horizontal_line(10, 520, :at => 350)
    pdf.vertical_line(350, 405, :at => 10)
    pdf.horizontal_line(10, 35, :at => 405)
end
pdf.draw_text "Lead Source", :at => [20, 375], :size => 12, :style => :bold
if(@customer.lead_source_id != nil)
    lead_source = LeadSource.find(@customer.lead_source_id).source
    pdf.draw_text lead_source, :at => [100, 375], :size => 11
end

pdf.draw_text "BUILDING INFORMATION", :at => [40, 300], :size => 13
pdf.stroke do
    pdf.horizontal_line(210, 520, :at => 305)
    pdf.vertical_line(305, 220, :at => 520)
    pdf.horizontal_line(10, 520, :at => 220)
    pdf.vertical_line(220, 305, :at => 10)
    pdf.horizontal_line(10, 35, :at => 305)
end
pdf.draw_text "Existing Roof Type:", :at => [20, 280], :size => 12, :style => :bold
if(@job_site.existing_roof_type_id != nil)
    existing_roof_type = RoofType.find(@job_site.existing_roof_type_id).roof_type
    pdf.draw_text existing_roof_type, :at => [130, 280], :size => 11
end
pdf.draw_text "How Many Storied:", :at => [20, 260], :size => 12, :style => :bold
if(@job_site.existing_roof_type_id != nil)
    pdf.draw_text @job_site.how_many_stories, :at => [130, 260], :size => 11
end
pdf.draw_text "Service Requested:", :at => [20, 240], :size => 12, :style => :bold
job_service_types = JobServiceType.where("job_id" =>@job_site.id)

if(job_service_types != nil && job_service_types.size > 0)
    total_service_type = ""
    job_service_types.each do |job_service_type|
        total_service_type = total_service_type + ServiceType.find(job_service_type.service_type_id).service_type + " "
    end
    pdf.draw_text total_service_type, :at => [130, 240], :size => 11
end

pdf.draw_text @job_site.lead_sheet_note, :at => [30, 100], :size => 11

pdf.stroke do
    pdf.horizontal_line(10, 520, :at => 50)
    pdf.vertical_line(50, 10, :at => 520)
    pdf.horizontal_line(10, 520, :at => 10)
    pdf.vertical_line(50, 10, :at => 10)
    pdf.vertical_line(50, 10, :at => 210)
    pdf.vertical_line(50, 10, :at => 390)
end
pdf.draw_text "Info Taken By:", :at => [20, 30], :size => 12, :style => :bold
if(@job_site.info_taken_by_id != nil)
    employee = Employee.find(@job_site.info_taken_by_id)
    first_name = employee.first_name
    last_name = employee.last_name
    info_taken_by = first_name +" "+last_name
    pdf.draw_text info_taken_by, :at => [100, 30], :size => 11
end

pdf.draw_text "Assigned To:", :at => [220, 30], :size => 12, :style => :bold
if(@job_site.sales_rep_id != nil)
    employee = Employee.find(@job_site.sales_rep_id)
    first_name = employee.first_name
    last_name = employee.last_name
    assign_to = first_name +" "+last_name
    pdf.draw_text assign_to, :at => [290, 30], :size => 11
end

pdf.draw_text "Date Taken:", :at => [400, 30], :size => 12, :style => :bold
if(@job_site.date_taken != nil)
    date_taken = @job_site.date_taken.strftime("%m/%d/%Y")
    pdf.draw_text date_taken, :at => [465, 30], :size => 11
end