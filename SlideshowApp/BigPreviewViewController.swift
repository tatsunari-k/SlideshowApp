import UIKit
class BigPreviewViewController: UIViewController {
    var bigimageName : String!  //bigimageに画像名を格納bigviewimageへの画像格納時の画像名指定に使用
    @IBOutlet weak var bigviewimageIBO: UIImageView!
    
    ///////////
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("動作確認")
        //print("\(bigimage)")
        bigviewimageIBO.image = UIImage(named: bigimageName)
        print("動作確認03")
        print("\(bigimageName)")
        //print("\(bigviewimage)")
    }
    
    /////動作順確認用に作成/////
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("動作確認04")
        //print("\(bigimageName)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
