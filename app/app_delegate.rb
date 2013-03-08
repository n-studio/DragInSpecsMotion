class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.backgroundColor = UIColor.whiteColor
    rootController = TableViewController.alloc.init
    @window.rootViewController = rootController
    @window.makeKeyAndVisible
    true
  end
end
