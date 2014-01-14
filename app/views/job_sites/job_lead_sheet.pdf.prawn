pdf.font "Helvetica"

x=0
y=755
pdf.image "#{Rails.root}/app/assets/images/banner.jpg", :width => 250, :height => 80, :at =>[x, y]

pdf.fill_color "8181F7"
x=370
y=690
pdf.draw_text "Lead Number", :at => [x, y], :size => 11
x=x+70
year = Time.now.strftime("%Y")
pdf.draw_text year+"-"+@job_site.id.to_s, :at => [x, y], :size => 11

pdf.fill_color "000000"

x=15
y=660
compNameY=y
unless  @customer.company_id.nil?
    company_name = Company.find(@customer.company_id).name
    pdf.draw_text company_name, :at => [x, y], :size => 11
    y=y-15
end
first_last_name = @customer.first_name + " "+ @customer.last_name
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
y=y-15
streetY= y
pdf.fill_color "000000"
pdf.draw_text @customer.street1, :at => [x, y], :size => 11
comma = ", "
if @customer.city.nil? || @customer.city.empty?
    city = ""
else
    city = @customer.city+ comma
end
if @customer.state.nil?|| @customer.state.empty?
    state = ""
else
    state = @customer.state+ comma
end
stateCityZip = city  + state + @customer.zip
y=y-15
pdf.draw_text stateCityZip, :at => [x, y], :size => 11

unless @customer.home_phone.nil? || @customer.home_phone.empty?
    y=y-15
    pdf.draw_text "Home", :at => [x, y], :size => 11
    x=80
    pdf.draw_text number_to_phone(@customer.home_phone), :at => [x, y], :size => 11
end
unless @customer.mobile_phone.nil? || @customer.mobile_phone.empty?
    y=y-15
    x=15
    pdf.draw_text "Cell", :at => [x, y], :size => 11
    x=80
    pdf.draw_text @customer.mobile_phone, :at => [x, y], :size => 11
end
x=15
y=y-15
cust_info_end_y = y
pdf.fill_color "0101DF"
pdf.line_width(1)
pdf.stroke_color "0101DF"
pdf.bounding_box([x,y+8], :width => 200, :height => 30) do
    pdf.text "<u>"+@customer.website+"</u>", :size => 11, :inline_format => true
end
pdf.stroke_color "000000"

pdf.fill_color "000000"
x=370
y=compNameY
pdf.bounding_box([x,y+8], :width => 200, :height => 30) do
pdf.text "<u>"+Time.now.strftime("%B %d, %Y")+"</u>", :size => 11, :inline_format => true
end

y=y-15
pdf.draw_text @job_site.contact_name, :at => [x, y], :size => 11
y=y-15
pdf.draw_text @job_site.street1, :at => [x, y], :size => 11
y=y-15
if @job_site.city.nil? || @job_site.city.empty?
    city = ""
else
    city = @job_site.city+ comma
end
if @job_site.state.nil?|| @job_site.state.empty?
    state = ""
else
    state = @job_site.state+ comma
end
stateCityZip = city  + state + @job_site.zip
pdf.draw_text stateCityZip, :at => [x, y], :size => 11

x=5
y=cust_info_end_y-10
pdf.stroke_color "045FB4"
pdf.stroke do
    pdf.line_width(6)
    pdf.horizontal_line(x, x+530, :at => y)
end
pdf.stroke_color "000000"
y=y-15
pdf.draw_text "REFERRAL INFORMATION:", :at => [x, y], :size => 11, :style => :bold
if @customer.lead_source_id != nil
    x=170
    lead_source = LeadSource.find(@customer.lead_source_id).source
    pdf.line_width(1)
    pdf.bounding_box([x,y+8], :width => 200, :height => 30) do
        pdf.text "<i><u>"+lead_source+"</u></i>", :size => 11, :inline_format => true
    end
end
x=5
y=y-15
pdf.draw_text "Notes:", :at => [x, y], :size => 11, :style => :bold

y=y-15
pdf.stroke_color "045FB4"
pdf.stroke do
    pdf.line_width(6)
    pdf.horizontal_line(x, x+530, :at => y)
end
pdf.stroke_color "000000"
pdf.line_width(1)

y=y-15
pdf.draw_text "BUILDING INFORMATION:", :at => [x, y], :size => 11, :style => :bold
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
y=y-15
pdf.draw_text "Approx Age:", :at => [x, y], :size => 11, :style => :bold
pdf.stroke do
    x=x+70
    pdf.horizontal_line(x, x+70, :at => y-3)
end

x=5
y=y-15
pdf.draw_text "Notes:", :at => [x, y], :size => 11, :style => :bold

y=y-15
pdf.stroke_color "045FB4"
pdf.stroke do
pdf.line_width(6)
pdf.horizontal_line(x, x+530, :at => y)
end
pdf.stroke_color "000000"
pdf.line_width(1)

y=y-15
pdf.draw_text "SERVICE REQUESTED:", :at => [x, y], :size => 11, :style => :bold

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
y=y-15
pdf.draw_text "NEW ROOF OPTIONS:", :at => [x, y], :size => 11, :style => :bold
job_roof_types = JobRoofType.where("job_id" =>@job_site.id)
if(job_roof_types != nil && job_roof_types.size > 0)
    total_roof_type = ""
    count = 0
    job_roof_types.each do |job_roof_type|
        count = count + 1
        total_roof_type = total_roof_type + RoofType.find(job_roof_type.new_roof_type_id).roof_type
        if count != job_roof_types.size
            total_roof_type = total_roof_type + ", "
        end
    end
    x=x+140
    pdf.bounding_box([x,y+9], :width => 500, :height => 100) do
    pdf.text "<i><u>"+total_roof_type+"</u></i>", :size => 11, :inline_format => true
    end
end

x=5
y=y-15
pdf.draw_text "Notes:", :at => [x, y], :size => 12, :style => :bold

y=y-15
pdf.stroke_color "045FB4"
pdf.stroke do
pdf.line_width(6)
pdf.horizontal_line(x, x+530, :at => y)
end
pdf.stroke_color "000000"
pdf.line_width(1)

x=10
y=50

pdf.text_box(@job_site.lead_sheet_note, :at => [x,y], :width => 530, :height => 100, :size => 11,
:overflow => :shrink_to_fit)

pdf.stroke do
    x=2
    y=20
    w=30
    l=180
    pdf.rectangle [x, y], l, w

    x1=x+5
    y1=y-20
    pdf.draw_text "Info Taken By:", :at => [x1, y1], :size => 11, :style => :bold
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
    pdf.rectangle [x, y], l, w
    x1=x+5
    pdf.draw_text "Assigned To:", :at => [x1, y1], :size => 11, :style => :bold
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
    pdf.rectangle [x, y], l, w
    x1=x+5
    pdf.draw_text "Date Taken:", :at => [x1, y1], :size => 11, :style => :bold
    if(@job_site.date_taken != nil)
        date_taken = @job_site.date_taken.strftime("%m/%d/%Y")

        pdf.bounding_box([x1+70,y1+8], :width => 100, :height => 30) do
            pdf.text "<u>"+date_taken+"</u>", :size => 11, :inline_format => true
        end
    end
end
