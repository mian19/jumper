
import UIKit

class TutorViewController: UIViewController {
    @IBOutlet weak var frIMV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var nextB: UIButton!
    var curr = 0
    @IBAction func onB(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onN(_ sender: Any) {
        if curr == 0 {
            frIMV.image = UIImage(named: "Frame 1")
        }
        if curr == 1 {
            frIMV.image = UIImage(named: "Frame 2")
            nextB.setImage(UIImage(named: "letsG"), for: .normal)
        }
        if curr == 2 {
            self.navigationController?.popViewController(animated: true)
        }
        
        
        curr += 1
    }
    
}
