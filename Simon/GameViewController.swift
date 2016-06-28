import UIKit
import AVFoundation


class GameViewController: UIViewController {
    
    //全局变量
    var gameState: NSString!
    var playListTimer: NSTimer!
    var newTimer: NSTimer!
    var guess: Int = 1
    var audioEffect: AVAudioPlayer!

    let screen = UIScreen.mainScreen().bounds

    var view1: UIView!
    var viewImage: UIView!
    
    var viewImage1: UIImageView!
    var viewImage2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setup()
        self.gameState = "Loading"
        self.newGame()
        
    }
    //新游戏
    func newGame(){
        //self.addAGuess()
        self.newTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("addAGuess"), userInfo: nil, repeats: true)
    }
    
    //随机数和定时器
    func addAGuess(){
        self.gameState = "GameTurn"
        //产生随机数
        let a = arc4random()
        let b = a%4
        let c = b+1
        let randEnemy:Int = Int(c)
        let soundNo:NSNumber = NSNumber(int: Int32(randEnemy))
        guess = Int(soundNo)
        //创建定时器
        self.playListTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("playSoundList"), userInfo: nil, repeats: false)
    }
    
    //每10s调用一次playSound
    func playSoundList(){
        let guessNo: NSNumber = guess
        self.playSound(guessNo.integerValue)
        self.gameState = "Play"
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("hideButtonImage"), userInfo: nil, repeats: false)
        
    }
    //让变亮的颜色变原先的颜色
    func hideButtonImage(){
        self.viewImage2.image = UIImage(named: "empty.png")
    }
    
    //判定调用音乐方法
    func playSound(tag: Int){
        var soundName: NSString = ""
        switch(tag){
        case 1:
            soundName = "red"
        case 2:
            soundName = "blue"
        case 3:
            soundName = "yellow"
        case 4:
            soundName = "green"
        default:
            soundName = "error"
        }
        self.viewImage2.image = UIImage(named: "\(soundName).png")
        self.playSoundEffect(soundName)
    }
    
    //获取音频并播放
    func playSoundEffect(effectName: NSString){
        //获取路径
        let path = NSBundle.mainBundle().pathForResource(effectName as String, ofType: "wav")
        let pathURL: NSURL = NSURL.fileURLWithPath(path!)
        audioEffect = try! AVAudioPlayer(contentsOfURL: pathURL)
        //实例化对象audioEffect
        audioEffect.numberOfLoops=0
        audioEffect.prepareToPlay()
        audioEffect.play()
    }
    
    //MARK: setup
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
        let buttonExit = UIButton(frame: CGRectMake(view1.bounds.width/4, 5, view1.bounds.width/2, 50))
        buttonExit.setTitle("Exit", forState: .Normal)
        buttonExit.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        buttonExit.setTitle("再见", forState: .Highlighted)
        buttonExit.titleLabel?.font = UIFont.systemFontOfSize(25.0)
        buttonExit.addTarget(self, action: Selector("buttonExit:"), forControlEvents: .TouchUpInside)
        self.view1.addSubview(buttonExit)
        
        //imageview
        viewImage = UIView(frame: CGRectMake(screen.width/16, screen.height/6, screen.width*7/8, screen.width*7/8))
        viewImage.backgroundColor = UIColor.clearColor()
        self.view.addSubview(viewImage)
        
        //imageView1
        viewImage1 = UIImageView(frame: CGRectMake(0, 0, viewImage.bounds.width, viewImage.bounds.height))
        viewImage1.image = UIImage(named: "gameboard")
        self.viewImage.addSubview(viewImage1)
        //imageView2
        viewImage2 = UIImageView(frame: CGRectMake(0, 0, viewImage.bounds.width, viewImage.bounds.height))
        viewImage2.image = UIImage(named: "empty")
        self.viewImage.addSubview(viewImage2)
        
        //button1
        let button1 = UIButton(frame: CGRectMake(0, 0, viewImage.bounds.width/2, viewImage.bounds.height/2))
        //button1.setBackgroundImage(UIImage(named: "red"), forState: .Normal)
//        button1.setTitle("-1", forState: .Highlighted)
        button1.addTarget(self, action: Selector("buttonAction:"), forControlEvents: .TouchUpInside)
        self.viewImage.addSubview(button1)
        
        //button2
        let button2 = UIButton(frame: CGRectMake(viewImage.bounds.width/2, 0, viewImage.bounds.width/2, viewImage.bounds.height/2))
        //button2.setBackgroundImage(UIImage(named: "blue"), forState: .Normal)
//        button2.setTitle("-2", forState: .Highlighted)
        button2.addTarget(self, action: Selector("buttonAction:"), forControlEvents: .TouchUpInside)
        self.viewImage.addSubview(button2)
        
        //button3
        let button3 = UIButton(frame: CGRectMake(0, viewImage.bounds.height/2, viewImage.bounds.width/2, viewImage.bounds.height/2))
        button3.setTitle("", forState: .Normal)
        
//        button3.setTitle("-3", forState: .Highlighted)
        button3.addTarget(self, action: Selector("buttonAction:"), forControlEvents: .TouchUpInside)
        self.viewImage.addSubview(button3)
        
        //button4
        let button4 = UIButton(frame: CGRectMake(viewImage.bounds.width/2, viewImage.bounds.height/2, viewImage.bounds.width/2, viewImage.bounds.height/2))
        button4.setTitle("", forState: .Normal)
//        button4.setTitle("-4", forState: .Highlighted)
        button4.addTarget(self, action: Selector("buttonAction:"), forControlEvents: .TouchUpInside)
        self.viewImage.addSubview(button4)
        
        //label1
        let label1 = UILabel(frame: CGRectMake(screen.width/16, screen.height*3/4, 100, 60))
        label1.text = "score:"
        label1.textColor = UIColor.grayColor()
        label1.font = UIFont.systemFontOfSize(25.0)
        self.view.addSubview(label1)
        
        //label2
        let label2 = UILabel(frame: CGRectMake(screen.width/4, screen.height*3/4, screen.width/2, 60))
        label2.text = "0"
        label2.textColor = UIColor.blackColor()
        label2.font = UIFont.systemFontOfSize(30.0)
        label2.textAlignment = NSTextAlignment.Center
        self.view.addSubview(label2)
        
    }
    
    //MARK: - buttons
    
    func buttonAction(sender: UIButton!){
        //判断游戏的状态
        if(!(self.gameState.isEqualToString("Play"))){
            return
        }
        //判断提示颜色代表的数字是否和按钮的tag值相同
        print("button")
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
