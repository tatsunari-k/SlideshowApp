import UIKit

class ViewController: UIViewController {
    //変数,関数,IBOによる利用変数名を先に記述
    //読み込みが必要な変数内の初期化はviewdidload内で宣言
    //viewdidloadの前にIBA類の関数をすべて記述する
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var previewStopButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var viewButtonIBO: UIButton!
    //使用する変数の定義
    var viewTime : Int!       //自動画像送り用の表示時間用変数
    var countNo : Int = 1     //画像番号
    // バンドルした画像ファイルを読み込み
    let image01 = UIImage(named: "01")!
    let image02 = UIImage(named: "02")!
    let image03 = UIImage(named: "03")!
    
    //IBActionを各ボタンで作成
    @IBAction func backButtonIBA(_ sender: AnyObject) {
        countNo -= 1
        if (countNo == 1){
            viewButtonIBO.setImage(image01, for: .normal)
        }
        else if (countNo == 2){
            viewButtonIBO.setImage(image02, for: .normal)
        }
        else if (countNo == 3){
            viewButtonIBO.setImage(image03, for: .normal)
        }
        else if (countNo < 1){
            viewButtonIBO.setImage(image03, for: .normal)
            countNo = 3
            
        }
    }
    
    @IBAction func previewStopButtonIBA(_ sender: AnyObject) {
        
        
    }
    @IBAction func nextButtonIBA(_ sender: AnyObject) {
        countNo += 1
        if (countNo == 1){
            viewButtonIBO.setImage(image01, for: .normal)
        }
        else if (countNo == 2){
            viewButtonIBO.setImage(image02, for: .normal)
        }
        else if (countNo == 3){
            viewButtonIBO.setImage(image03, for: .normal)
        }
        else if (countNo > 3){
            viewButtonIBO.setImage(image01, for: .normal)
            countNo = 1
        }
    }
    

    @IBAction func backTopView(_ segue: UIStoryboardSegue) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        
        viewButtonIBO.setImage(image01, for: .normal)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

