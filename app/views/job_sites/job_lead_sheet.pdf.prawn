pdf.font "Helvetica"

x=5
y=750
pdf.image "#{Rails.root}/app/assets/images/banner.jpg", :width => 250, :height => 80, :at =>[x, y]

pdf.stroke do
    y=665
    pdf.rectangle [5, 665], 530, 140
end
pdf.fill_color "8181F7"
x=350
y=670
pdf.draw_text "Lead Number", :at => [x, y], :size => 11
x=420
year = Time.now.strftime("%Y")
pdf.draw_text year+"-"+@job_site.id.to_s, :at => [x, y], :size => 11

pdf.fill_color "000000"

x=15
y=650
company_name = Company.find(@customer.company_id).name unless @customer.company_id.nil?
pdf.draw_text company_name, :at => [x, y], :size => 11
first_last_name = @customer.first_name + " "+ @customer.last_name
y=y-15
pdf.draw_text first_last_name, :at => [x, y], :size => 11

pdf.fill_color "0101DF"
x=140
pdf.line_width(1)
pdf.stroke_color "0101DF"
pdf.bounding_box([x,y+8], :width => 200, :height => 30) do
    pdf.text "<u>"+@customer.email+"</u>", :size => 11, :inline_format => true
end
pdf.stroke_color "000000"

x=15
y=620
pdf.fill_color "000000"
pdf.draw_text @customer.street1, :at => [x, y], :size => 11
stateCityZip = @customer.city+", " + @customer.state + ", "+ @customer.zip
y=y-15
pdf.draw_text stateCityZip, :at => [x, y], :size => 11
y=y-15
pdf.draw_text "Home", :at => [x, y], :size => 11
x=80
pdf.draw_text @customer.home_phone, :at => [x, y], :size => 11
y=y-15
x=15
pdf.draw_text "Cell", :at => [x, y], :size => 11
x=80
pdf.draw_text @customer.mobile_phone, :at => [x, y], :size => 11
x=15
y=y-15
pdf.fill_color "0101DF"
pdf.line_width(1)
pdf.stroke_color "0101DF"
pdf.bounding_box([x,y+8], :width => 200, :height => 30) do
    pdf.text "<u>"+@customer.website+"</u>", :size => 11, :inline_format => true
end
pdf.stroke_color "000000"

pdf.fill_color "000000"
x=370
y=650
pdf.bounding_box([x,y+8], :width => 200, :height => 30) do
pdf.text "<u>"+Time.now.strftime("%B %d, %Y")+"</u>", :size => 11, :inline_format => true
end

y=y-25
pdf.draw_text @job_site.street1, :at => [x, y], :size => 11
y=y-15
stateCityZip = @job_site.city+", " + @job_site.state + ", "+ @job_site.zip
pdf.draw_text stateCityZip, :at => [x, y], :size => 11

x=5
y=500
pdf.stroke_color "045FB4"
pdf.stroke do
    pdf.line_width(6)
    pdf.horizontal_line(x, x+530, :at => y)
end
pdf.stroke_color "000000"
y=y-25
pdf.draw_text "REFERRAL INFORMATION:", :at => [x, y], :size => 12, :style => :bold
x=170
if @customer.lead_source_id != nil
    lead_source = LeadSource.find(@customer.lead_source_id).source
    pdf.line_width(1)
    pdf.bounding_box([x,y+8], :width => 200, :height => 30) do
        pdf.text "<i><u>Lead Source "+lead_source+"</u></i>", :size => 11, :inline_format => true
    end
end
x=5
y=y-30
pdf.draw_text "Notes:", :at => [x, y], :size => 12, :style => :bold

y=y-20
pdf.stroke_color "045FB4"
pdf.stroke do
    pdf.line_width(6)
    pdf.horizontal_line(x, x+530, :at => y)
end
pdf.stroke_color "000000"
pdf.line_width(1)

y=y-25
pdf.draw_text "BUILDING INFORMATION:", :at => [x, y], :size => 12, :style => :bold
x=x+150
pdf.draw_text "Existing Roof Type:", :at => [x, y], :size => 11, :style => :bold
if(@job_site.existing_roof_type_id != nil)
    existing_roof_type = RoofType.find(@job_site.existing_roof_type_id).roof_type
    x=x+110
    pdf.bounding_box([x,y+8], :width => 200, :height => 30) do
        pdf.text "<i><u>"+existing_roof_type+"</u></i>", :size => 11, :inline_format => true
    end
end
x=x+130
pdf.draw_text "How Many Storied:", :at => [x, y], :size => 11, :style => :bold
if(@job_site.existing_roof_type_id != nil)
x=x+100
    pdf.bounding_box([x,y+8], :width => 200, :height => 30) do
        pdf.text "<i><u>"+@job_site.how_many_stories.to_s+"</u></i>", :size => 11, :inline_format => true
    end
end
x=155
y=y-20
pdf.draw_text "Approx Age:", :at => [x, y], :size => 11, :style => :bold
pdf.stroke do
    x=x+70
    pdf.horizontal_line(x, x+70, :at => y-3)
end

x=5
y=y-30
pdf.draw_text "Notes:", :at => [x, y], :size => 12, :style => :bold

y=y-20
pdf.stroke_color "045FB4"
pdf.stroke do
pdf.line_width(6)
pdf.horizontal_line(x, x+530, :at => y)
end
pdf.stroke_color "000000"
pdf.line_width(1)

y=y-25
pdf.draw_text "SERVICE REQUESTED:", :at => [x, y], :size => 12, :style => :bold

job_service_types = JobServiceType.where("job_id" =>@job_site.id)
if(job_service_types != nil && job_service_types.size > 0)
    total_service_type = ""
    count = 0
    job_service_types.each do |job_service_type|
        count = count + 1
        total_service_type = total_service_type + ServiceType.find(job_service_type.service_type_id).service_type
        if count != job_service_types.size
            total_service_type = total_service_type + ", "
        end
    end
    x=x+140
    pdf.bounding_box([x,y+9], :width => 500, :height => 100) do
        pdf.text "<i><u>"+total_service_type+"</u></i>", :size => 11, :inline_format => true
    end
end
x=5
y=y-25
pdf.draw_text "NEW ROOF OPTIONS:", :at => [x, y], :size => 12, :style => :bold
pdf.stroke do
    x=x+130
    pdf.rectangle [x, y+12], 120, 15
    x=x+130
    pdf.rectangle [x, y+12], 120, 15
    x=x+130
    pdf.rectangle [x, y+12], 120, 15
end
x=5
y=y-30
pdf.draw_text "Notes:", :at => [x, y], :size => 12, :style => :bold

y=y-20
pdf.stroke_color "045FB4"
pdf.stroke do
pdf.line_width(6)
pdf.horizontal_line(x, x+530, :at => y)
end
pdf.stroke_color "000000"
pdf.line_width(1)

x=10
y=y-150

pdf.text_box(@job_site.lead_sheet_note, :at => [x,y], :width => 530, :height => 100, :size => 11,
:overflow => :shrink_to_fit)

pdf.stroke do
    x=2
    y=30
    pdf.rectangle [x, y], 180, 50

    x1=x+5
    y1=y-30
    pdf.draw_text "Info Taken By:", :at => [x1, y1], :size => 12, :style => :bold
    if(@job_site.info_taken_by_id != nil)
        employee = Employee.find(@job_site.info_taken_by_id)
        first_name = employee.first_name
        last_name = employee.last_name
        info_taken_by = first_name +" "+last_name
        pdf.bounding_box([x1+85,y1+8], :width => 100, :height => 30) do
            pdf.text "<u>"+info_taken_by+"</u>", :size => 11, :inline_format => true
        end
    end

    x=x+180
    pdf.rectangle [x, y], 180, 50
    x1=x+5
    y1=y-30
    pdf.draw_text "Assigned To:", :at => [x1, y1], :size => 12, :style => :bold
    if(@job_site.sales_rep_id != nil)
        employee = Employee.find(@job_site.sales_rep_id)
        first_name = employee.first_name
        last_name = employee.last_name
        assign_to = first_name +" "+last_name
        pdf.bounding_box([x1+80,y1+8], :width => 100, :height => 30) do
            pdf.text "<u>"+assign_to+"</u>", :size => 11, :inline_format => true
        end
    end

    x=x+180
    pdf.rectangle [x, y], 180, 50
    x1=x+5
    y1=y-30
    pdf.draw_text "Date Taken:", :at => [x1, y1], :size => 12, :style => :bold
    if(@job_site.date_taken != nil)
        date_taken = @job_site.date_taken.strftime("%m/%d/%Y")

        pdf.bounding_box([x1+70,y1+8], :width => 100, :height => 30) do
            pdf.text "<u>"+date_taken+"</u>", :size => 11, :inline_format => true
        end
    end
end
