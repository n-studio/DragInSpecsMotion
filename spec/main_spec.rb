describe "Application 'RMSpecBug'" do
  before do
    self.extend Bacon::Functional::API
    @app = UIApplication.sharedApplication
  end

  it "open alert view on 5th row" do
    frame = view('tableView').frame
    @points = [CGPointMake(CGRectGetMidX(frame), CGRectGetMaxY(frame) - 10), CGPointMake(CGRectGetMidX(frame), CGRectGetMinY(frame) + 10)]
    wait 1 do
      drag 'tableView', :points => @points, :duration => 1
      wait 1 do
        tap 'row_0_4'
        wait 1 do
          @view = view 'ok'
          @view.superview.class.should == UIAlertView
        end
      end
    end
  end
end
