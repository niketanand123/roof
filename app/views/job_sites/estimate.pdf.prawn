pdf.font "Times-Roman"

pdf.image "#{Rails.root}/app/assets/images/banner.jpg", :width => 180, :height => 60
pdf.draw_text "ESTIMATE", :at => [230, 680], :size => 20, :style => :bold
pdf.draw_text Time.now.strftime("%m/%d/%Y"), :at => [250, 665], :size => 11

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
pdf.draw_text @job_site.mobile_phone, :at => [370, 520], :size => 11

pdf.draw_text "We submit specifications and estimates for the following", :at => [40, 420], :size => 12, :style => :bold
pdf.stroke do
    pdf.horizontal_line(330, 520, :at => 425)
    pdf.horizontal_line(10, 35, :at => 425)
end

y_axis = 380
if (@job_estimates.size > 0)
    pdf.draw_text "Step", :at => [10, 400], :size => 12, :style => :bold
    pdf.draw_text "Description", :at => [60, 400], :size => 12, :style => :bold
    pdf.draw_text "Fee", :at => [360, 400], :size => 12, :style => :bold
    pdf.draw_text "Qty", :at => [420, 400], :size => 12, :style => :bold
    pdf.draw_text "Extended", :at => [475, 400], :size => 12, :style => :bold

    total_price = 0.0
    @job_estimates.each do |job_estimate|
        pdf.draw_text job_estimate.step, :at => [12, y_axis], :size => 11
        pdf.draw_text Assembly.where(:id=>job_estimate.master_item_id).pluck(:item_description).first, :at => [57, y_axis], :size => 11
        pdf.draw_text "$"+job_estimate.retail_price.to_s, :at => [358, y_axis], :size => 11
        pdf.draw_text job_estimate.qty, :at => [425, y_axis], :size => 11
        pdf.draw_text "$"+job_estimate.item_extended.to_s, :at => [477, y_axis], :size => 11
        y_axis = y_axis - 30
        total_price = total_price + job_estimate.item_extended
    end
    y_axis = y_axis - 20
    pdf.draw_text "Total Items:", :at => [10, y_axis], :size => 11
    pdf.draw_text "$"+total_price.to_s, :at => [120, y_axis], :size => 11
    y_axis = y_axis - 20
    pdf.draw_text "Price Adjustment:", :at => [10, y_axis], :size => 11
    y_axis = y_axis - 20
    pdf.draw_text "ESTIMATE TOTAL:", :at => [10, y_axis], :size => 11
end

y_axis = y_axis-40
pdf.draw_text "Payments:", :at => [10, y_axis], :size => 11
pdf.draw_text "Deposit Due:", :at => [110, y_axis], :size => 11
if @job_site.deposit_due != nil && @job_site.deposit_due != ""
    pdf.draw_text "$"+@job_site.deposit_due.to_s, :at => [180, y_axis], :size => 11
end
pdf.draw_text "Deposit Method:", :at => [220, y_axis], :size => 11
if @job_site.deposit_method != nil
    pdf.draw_text @job_site.deposit_method, :at => [300, y_axis], :size => 11
end
pdf.draw_text "(1/3rd) At Dry in/Balance on Completion", :at => [380, y_axis], :size => 11
y_axis = y_axis-20
pdf.draw_text "Terms:", :at => [10, y_axis], :size => 11
y_axis = y_axis-20
pdf.draw_text "Job Start Date:", :at => [10, y_axis], :size => 11
if @job_site.job_start_date != nil
    pdf.draw_text @job_site.job_start_date.strftime("%m/%d/%Y"), :at => [110, y_axis], :size => 11
end
y_axis = y_axis-20
pdf.draw_text "Sales Rep:", :at => [10, y_axis], :size => 11
if @job_site.sales_rep_id != nil
    employee_name = Employee.where(:id=>@job_site.sales_rep_id).pluck(:last_name).first+", "+ Employee.where(:id=>@job_site.sales_rep_id).pluck(:first_name).first
    pdf.draw_text employee_name, :at => [110, y_axis], :size => 11
end

y_axis = y_axis-80
pdf.draw_text "**King Roofing Provides Experienced on Site Field Supervision on Every Job we Install for Quality Assurance**", :at => [30, y_axis], :size => 10, :style => :bold
y_axis = y_axis-10
pdf.draw_text "All contracts are subject to review by the home office and may be terminated at any time prior to stat date. All contract to be", :at => [20, y_axis], :size => 10
y_axis = y_axis-10
pdf.draw_text "approved by authorized representative. NOTE: This proposal may be withdrawn by us if not accepted within 15 days. Owner", :at => [20, y_axis], :size => 10
y_axis = y_axis-10
pdf.draw_text "reserves the right of Three (3) Days rescission", :at => [150, y_axis], :size => 10
y_axis = y_axis-5
pdf.stroke do
    pdf.horizontal_line(10, 520, :at => y_axis)
end


