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
    var viewTime : Int!         //自動画像送り用の表示時間用変数
    var timer: Timer! = nil         /// 一定の間隔で処理を行うためのタイマー
    var timer_sec: Int = 0  //時間経過管理用の変数
    var countNo : Int = 0       //画像番号
    var textPreviewStop :String! //再生/停止ボタン用テキスト
    
    //画像管理用の配列
    let images: [String] = ["01.JPG","02.JPG","03.JPG"]
    //swiftではプロパティの読み込み順は定義されていないため、プロパティを宣言する時の初期値に、別のプロパティ変数を使えない
    //images[0]　→　01.JPG で画像名を指定
    var viewimage : UIImage!
    
    ///////////画像送り関数/////////////
    @objc func updateTimer(_ timer: Timer) {
        timer_sec += 1
        countNo += 1
        if (countNo >= images.count){
            countNo = 0
        }
        print("\(countNo)")
        viewimage = UIImage(named: "\(images[countNo])")//配列からimagesデータを格納する
        print("\(images[countNo])")
        viewButtonIBO.setImage(viewimage, for: .normal)//更新したデータを格納した変数を使用して画像を表示
    }
    
    ///////////画面遷移時に表示中の画像名を抽出/////////////
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let bigPreviewViewController:BigPreviewViewController = segue.destination as! BigPreviewViewController
        // 遷移先のResultViewControllerで宣言しているbigimageに画像名を渡す
        bigPreviewViewController.bigimageName = images[countNo]
        print("動作確認02")
        print("\(bigPreviewViewController.bigimageName)")
        print("\(images[countNo])")
        
        if self.timer != nil {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil
            // ボタンの操作を有効化
            backButton.isEnabled = true
            nextButton.isEnabled = true
            backButton.alpha = 1
            nextButton.alpha = 1
            //backButton.setTitleColor(UIColor.white, for: .normal)//テキストカラーの変更
            self.previewStopButton.setTitle("再生", for: .normal)
        }
        
    }
    
    ///////////戻るボタン/////////////
    @IBAction func backButtonIBA(_ sender: AnyObject) {
        countNo -= 1
        //-1していくため、0以下になった際countNo内の数字を変更して表示
        if (countNo < 0){
            countNo = images.count //0以下になったら配列の最後の数字をcountNo内に格納今回だと3つ
            countNo -= 1//配列の数3に対して、配列の序列指定は-1しないとずれる
        }
        //print("\(countNo)")
        viewimage = UIImage(named: "\(images[countNo])")//配列からimagesデータを格納する
        //print("\(images[countNo])")
        viewButtonIBO.setImage(viewimage, for: .normal)//更新したデータを格納した変数を使用して画像を表示
    }
    
    ////////////再生・停止ボタン////////////
    @IBAction func previewStopButtonIBA(_ sender: AnyObject) {
        //2秒ごとに指定のupdateTimer関数を呼び出す処理
        if self.timer == nil {
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            // ボタンの操作を無効
            backButton.isEnabled = false
            nextButton.isEnabled = false
            backButton.alpha = 0.3
            nextButton.alpha = 0.3
            //backButton.setTitleColor(UIColor(red:0.96, green:0.55, blue:0.15, alpha:1.0), for: .normal)
            self.previewStopButton.setTitle("停止", for: .normal)
        }
        //このままじゃ永遠に加算されていくのでインスタンスがあるか否かをチェックし、条件分岐させる
        else if self.timer != nil {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil
            // ボタンの操作を有効化
            backButton.isEnabled = true
            nextButton.isEnabled = true
            backButton.alpha = 1
            nextButton.alpha = 1
            //backButton.setTitleColor(UIColor.white, for: .normal)//テキストカラーの変更
            self.previewStopButton.setTitle("再生", for: .normal)
        }
    }
    
    ////////////戻るボタン////////////
    @IBAction func nextButtonIBA(_ sender: AnyObject) {
        countNo += 1
        //-1していくため、0以下になった際countNo内の数字を変更して表示
        if (countNo >= images.count){
            countNo = 0
        }
        print("\(countNo)")
        viewimage = UIImage(named: "\(images[countNo])")//配列からimagesデータを格納する
        print("\(images[countNo])")
        viewButtonIBO.setImage(viewimage, for: .normal)//更新したデータを格納した変数を使用して画像を表示
       }

    ////////////画像プレビュー画面から戻るセグエ////////////
    @IBAction func backTopView(_ segue: UIStoryboardSegue) {
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        //初期画像のセット
        viewimage = UIImage(named: "\(images[countNo])")//配列からimagesデータを格納する
        //print("\(images[countNo])")
        viewButtonIBO.setImage(viewimage, for: .normal)//更新したデータを格納した変数を使用して画像を表示
        //print("動作確認")
        //print("\(images[countNo])")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
