import UIKit

class ViewController: UIViewController {

    //view， button， screen 的尺寸
    let screen = UIScreen.mainScreen().bounds
    let view_size_height: CGFloat = 60
    let button_size_height: CGFloat = 40

    var view1: UIView!
    var view2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }

    func setup(){
        //imageBackground
        let bg =  UIImageView(frame: CGRectMake(0, 0, screen.width, screen.height))
        bg.image = UIImage(named: "background")
        self.view.addSubview(bg)
        
        //view
        let imageView = UIImageView(frame: CGRectMake(screen.width/8, screen.height/6, screen.width*3/4, screen.height/3))
        imageView.image = UIImage(named: "logo")
        self.view.addSubview(imageView)
        
        //viewPlay
        view1 = UIView(frame: CGRectMake(screen.width/8, screen.height*2/3, screen.width*3/4, view_size_height))
        view1.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.6)
        self.view.addSubview(view1)
        
        //buttonPlay
        let button1 = UIButton(frame: CGRectMake(view1.bounds.width/8, 10, view1.bounds.width*3/4, button_size_height))
        button1.setTitle("Play Game", forState: .Normal)
        button1.setTitle("哟哟哟", forState: .Highlighted)
        button1.titleLabel?.font = UIFont.systemFontOfSize(25.0)
        button1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button1.addTarget(self, action: Selector("buttonPlay:"), forControlEvents: .TouchUpInside)
        self.view1.addSubview(button1)
        
        //viewDescription
        view2 = UIView(frame: CGRectMake(screen.width/8, screen.height*4/5, screen.width*3/4, view_size_height))
        view2.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.6)
        self.view.addSubview(view2)
        
        //buttonDescription
        let button2 = UIButton(frame: CGRectMake(view2.bounds.width/8, 10, view2.bounds.width*3/4, button_size_height))
        button2.setTitle("Game Description", forState: .Normal)
        button2.setTitle("嘿嘿嘿", forState: .Highlighted)
        button2.titleLabel?.font = UIFont.systemFontOfSize(25.0)
        button2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button2.addTarget(self, action: Selector("buttonDescription:"), forControlEvents: .TouchUpInside)
        self.view2.addSubview(button2)
    }
    
    //buttonPlay
    func buttonPlay(sender: UIButton!){
        print("buttonPlay")
        let buttonPlay = GameViewController()
        self.presentViewController(buttonPlay, animated: true, completion: nil)
    }
    
    //buttonDescription
    func buttonDescription(sender: UIButton!){
        print("buttonDesription")
        let buttonDesription = ListViewController()
        self.presentViewController(buttonDesription, animated: true, completion: nil)
    }

}

