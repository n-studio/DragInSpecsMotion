Try to scroll the tableView and then click on a row.
Works on iOS6.0 simulator, not on iOS5.0 simulator.
iOS6.0 doesn't require -/+10 trick to scroll, but iOS5.0 won't scroll without it.

Even if iOS5.0 manages to scroll the view, nothing can be clicked afterwards

```ruby
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
```