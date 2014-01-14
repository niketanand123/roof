pdf.font "Helvetica"

x=0
y=755
pdf.image "#{Rails.root}/app/assets/images/banner.jpg", :width => 250, :height => 80, :at =>[x, y]

pdf.fill_color "5858FA"
pdf.bounding_box([x+20,y-85], :width => 200, :height => 50) do
    pdf.text "1755 J&C BOULEVARD • NAPLES, FLORIDA 34109
                (239) 598-2414 • FAX (239) 598-3745
                    LIC. # CCC057279", :size => 8, :inline_format => true
end
pdf.fill_color "FE9A2E"
pdf.bounding_box([x+350,y-60], :width => 180, :height => 30) do
pdf.text "<b><i>Serving SW Florida Since 1979</i></b>", :size => 11, :inline_format => true
end

pdf.fill_color "000000"
x=15
y=620
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

if (@job_estimate_items.size > 0)
    x=0
    y=cust_info_end_y-20
    pdf.draw_text "WE HEREBY SUBMIT THE FOLLOWING PROPOSAL AND SPECIFICATIONS FOR:", :at => [x, y], :size => 10, :style => :bold
    pdf.bounding_box([x+390,y+8], :width => 200, :height => 30) do
    pdf.text "<b><u>Roof repair/replacement as follows</u></b>", :size => 10, :inline_format => true
    end

    y_axis = y-20
    x_axis = x+12
    total_price = 0.0
    @job_estimate_items.each do |job_estimate_item|
        pdf.fill_color "04B431"
        pdf.draw_text job_estimate_item.step, :at => [x_axis, y_axis], :size => 11
        pdf.bounding_box([x_axis+20,y_axis+8], :width => 500, :height => 30) do
            desc =  Assembly.where(:id=>job_estimate_item.master_item_id).pluck(:proposal_description).first
            pdf.text "<b><i><u>"+ desc +"</u></i></b>", :size => 10, :inline_format => true
        end
        y_axis = y_axis - 20
    end
end
pdf.fill_color "000000"
x=0
y=y_axis-15

pdf.bounding_box([x,y+8], :width => 550, :height => 50) do
    pdf.text "<i>KING ROOFING WILL UPON FINAL PAYMENT ISSUE A WRITTEN <u>FIVE (5) FIVE YEAR WARRANTY </u>CERTIFICATE AGAINST INSTALLATION DEFECTS OR INTENDED PERFORMANCE FAILURE.</i>", :size => 10, :inline_format => true
end

x=5
y=100

pdf.bounding_box([x,y+8], :width => 550, :height => 50) do
pdf.text "<u><b>Include:</b></u> All applicable permits, disposal, taxes, insurance and inspections. <u>ALL OF OUR INSTALLERS ARE IN HOUSE EMPLOYEES</u> and are covered
    under our workers compensation insurance. <u><color rgb='FF0000'>We do not use sub-contractors or exempt insurance policies</color></u>. We are Proud to be a “Drug Free Workplace”.
    Please check our references!", :size => 8, :inline_format => true
end

pdf.font_size(9) do
    y_axis = y-30
    pdf.draw_text "PAYMENT TERMS: (Deposit 1/3rd)", :at => [x, y_axis]
    pdf.stroke do
        pdf.horizontal_line(165, 255, :at => y_axis)
    end
    pdf.draw_text "Method", :at => [255, y_axis], :style =>:bold
    pdf.stroke do
        pdf.horizontal_line(290, 355, :at => y_axis)
    end
    pdf.draw_text "(1/3rd) At Dry in/Balance on Completion", :at => [355, y_axis], :style =>:bold

    y_axis = y_axis-25
    pdf.draw_text "Accepted by:", :at => [x, y_axis], :style =>:bold
    pdf.stroke do
    pdf.horizontal_line(65, 180, :at => y_axis)
    end
    pdf.draw_text "Date:", :at => [180, y_axis], :style =>:bold
    pdf.stroke do
    pdf.horizontal_line(200, 270, :at => y_axis)
    end
    pdf.draw_text "Approved by:", :at => [280, y_axis], :style =>:bold
    pdf.stroke do
    pdf.horizontal_line(338, 450, :at => y_axis)
    end
    pdf.draw_text "Date:", :at => [450, y_axis], :style =>:bold
    pdf.stroke do
    pdf.horizontal_line(470, 540, :at => y_axis)
    end
    y_axis = y_axis-8
    pdf.draw_text "William C. King, Pres./Owner", :at => [338, y_axis], :style => :italic
y_axis = 25
pdf.stroke_rectangle [x,y_axis], 535, 30
pdf.bounding_box([x+2,y_axis-1], :width => 535, :height => 30) do
pdf.text "<b>All contracts are subject to review by the home office and may be terminated at any time prior to start date. All contract to be approved by authorized representative. NOTE: This proposal may be withdrawn by us if not accepted within <u>15</u> days. Owner reserves the right of Three (3) Days rescission</b>", :size => 9, :inline_format => true
end
end

x = x+50
y=y_axis-35
pdf.image "#{Rails.root}/app/assets/images/visa.jpg", :width => 50, :height => 20, :at =>[x, y]
pdf.bounding_box([x+150,y-3], :width => 200, :height => 30) do
pdf.text "<i><b><color rgb='0101DF'>Call “Us” When Quality Really Matters</color></b></i>", :size => 9, :inline_format => true
end

pdf.image "#{Rails.root}/app/assets/images/master.jpg", :width => 50, :height => 20, :at =>[x+400, y]