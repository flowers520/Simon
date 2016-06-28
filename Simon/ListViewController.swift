import UIKit

class ListViewController: UIViewController {

    let screen = UIScreen.mainScreen().bounds
    var view1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }

    func setup(){
        //background
        let bg = UIImageView(frame: CGRectMake(0, 0, screen.width, screen.height))
        bg.image = UIImage(named: "background")
        self.view.addSubview(bg)
        
        //viewExit
        view1 = UIView(frame: CGRectMake(0, screen.height-60, screen.width, 60))
        view1.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.6)
        self.view.addSubview(view1)
        
        //buttonExit
        let button1 = UIButton(frame: CGRectMake(view1.bounds.width/4, 5, view1.bounds.width/2, 50))
        button1.setTitle("Exit", forState: .Normal)
        button1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button1.titleLabel?.font = UIFont.systemFontOfSize(25.0)
        button1.setTitle("再见", forState: .Highlighted)
        button1.addTarget(self, action: Selector("buttonExit:"), forControlEvents: .TouchUpInside)
        self.view1.addSubview(button1)
        
    }
    
    func buttonExit(sender: UIButton!){
        print("buttonExit")
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
