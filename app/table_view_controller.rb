class TableViewController < UITableViewController
  
  def viewDidLoad
    super
    
    self.tableView.accessibilityLabel = "tableView"
    
    self.tableView.dataSource = self
    self.tableView.delegate = self
    @data = [
      "Row 1",
      "Row 2",
      "Row 3",
      "Row 4",
      "Row 5",
      "Row 6",
      "Row 7"
    ]
    
  end
  
  def numberOfSectionsInTableView(tableView)
    1
  end
  
  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end
  
  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cellIdentifier = "Cell"
    cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) || begin
      c = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: cellIdentifier)
      c
    end
      
    cell.accessibilityLabel = "row_#{indexPath.section}_#{indexPath.row}"
    cell.textLabel.text = @data[indexPath.row]
    cell
  end
  
  def tableView(tableView, heightForRowAtIndexPath: indexPath)
    150
  end
  
  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    alert = UIAlertView.alloc.initWithTitle("You clicked!",
      message: "It's working! row: #{indexPath.row}",
      delegate: self,
      cancelButtonTitle: "ok",
      otherButtonTitles: nil
    )
    alert.show
  end
end
