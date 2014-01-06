pdf.font "Helvetica"

x=5
y=750
pdf.image "#{Rails.root}/app/assets/images/banner.jpg", :width => 250, :height => 80, :at =>[x, y]

pdf.stroke do
y=665
pdf.rectangle [5, 665], 530, 120
end
pdf.fill_color "8181F7"
x=350
y=670
pdf.draw_text "Estimate Number", :at => [x, y], :size => 11
x=x+90
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

y=500
x=10
if (@job_estimates.size > 0)
    pdf.draw_text "DESCRIPTION", :at => [x, y], :size => 12, :style => :bold
    x1=x+350
    pdf.draw_text "QUANTITY", :at => [x1, y], :size => 12, :style => :bold
    x2=x1+80
    pdf.draw_text "RATE", :at => [x2, y], :size => 12, :style => :bold
    x3=x2+50
    pdf.draw_text "AMOUNT", :at => [x3, y], :size => 12, :style => :bold
    pdf.stroke do
        pdf.line_width(1)
        pdf.horizontal_line(x, x+530, :at => y-2)
    end
    total_price = 0.0
    y = y - 30
    @job_estimates.each do |job_estimate|
        pdf.draw_text Assembly.where(:id=>job_estimate.master_item_id).pluck(:item_description).first, :at => [x+5, y], :size => 11
        pdf.draw_text job_estimate.qty, :at => [x1, y], :size => 11
        pdf.draw_text "$"+job_estimate.retail_price.to_s, :at => [x2, y], :size => 11
        pdf.draw_text "$"+job_estimate.item_extended.to_s, :at => [x3+10, y], :size => 11
        y = y - 30
        total_price = total_price + job_estimate.item_extended
    end
    y = y - 20
    pdf.stroke do
        pdf.line_width(1)
        pdf.horizontal_line(x, x+530, :at => y-2)
    end
    end
    x=x+440
    y = y - 15
    pdf.draw_text "TOTAL:", :at => [x, y], :size => 12, :style=>:bold
    pdf.draw_text "$"+total_price.to_s, :at => [x+50, y], :size => 11

