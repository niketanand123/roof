pdf.font "Helvetica"

x=0
y=755
pdf.image "#{Rails.root}/app/assets/images/banner.jpg", :width => 250, :height => 80, :at =>[x, y]

pdf.fill_color "8181F7"
x=330
y=690
pdf.draw_text "Estimate Number:", :at => [x, y], :size => 11
x=x+90
pdf.draw_text @job_estimate.name, :at => [x, y], :size => 11

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

y=cust_info_end_y-30
x=10
if (@job_estimate_items.size > 0)
    pdf.draw_text "DESCRIPTION", :at => [x, y], :size => 11, :style => :bold
    x1=x+350
    pdf.draw_text "QUANTITY", :at => [x1, y], :size => 11, :style => :bold
    x2=x1+80
    pdf.draw_text "RATE", :at => [x2, y], :size => 11, :style => :bold
    x3=x2+50
    pdf.draw_text "AMOUNT", :at => [x3, y], :size => 11, :style => :bold
    pdf.stroke do
        pdf.line_width(1)
        pdf.horizontal_line(x, x+530, :at => y-2)
    end
    total_price = 0.0
    y = y - 20
    @job_estimate_items.each do |job_estimate_item|
        desc = Assembly.where(:id=>job_estimate_item.master_item_id).pluck(:item_description).first
        pdf.text_box(desc, :at => [x+2,y+10], :width => 350, :height => 100, :size => 11,
:overflow => :shrink_to_fit)
        pdf.draw_text job_estimate_item.qty, :at => [x1, y], :size => 11
        pdf.draw_text number_to_currency(job_estimate_item.retail_price), :at => [x2, y], :size => 11
        pdf.draw_text number_to_currency(job_estimate_item.item_extended), :at => [x3+10, y], :size => 11
        y = y - 20
        total_price = total_price + job_estimate_item.item_extended
    end
    pdf.stroke do
        pdf.line_width(1)
        pdf.horizontal_line(x, x+530, :at => y+5)
    end
    end
    x=x+435
    y = y - 5
    pdf.draw_text "TOTAL:", :at => [x, y], :size => 11, :style=>:bold
    pdf.draw_text number_to_currency(total_price), :at => [x+50, y], :size => 11

