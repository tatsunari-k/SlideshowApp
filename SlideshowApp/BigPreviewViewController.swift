import UIKit
class BigPreviewViewController: UIViewController {
    var bigviewimage : UIImage!  //bigviewimageにbigaimageの画像名を利用して画像を格納
    var bigimage : String!  //bigimageに画像名を格納bigviewimageへの画像格納時の画像名指定に使用
    @IBOutlet weak var bigviewimageIBO: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //動作確認
        //bigimage = "01"
        //bigviewimage = UIImage(named:"01")
        //bigviewimageIBO.image = bigviewimage
        //print("動作確認")
        //print("\(bigimage)")
        bigviewimage = UIImage(named: "\(bigimage)")//配列からimagesデータを格納する
        bigviewimageIBO.image = bigviewimage//更新したデータを格納した変数を使用して画像を表示
        print("動作確認03")
        print("\(bigimage)")
        print("\(bigviewimage)")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("動作確認")
        print("\(bigimage)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
