
import UIKit
import StoreKit
import AVFoundation

class StartViewControllerJUMP: UIViewController {

    @IBAction func setBut(_ sender: Any) {
        let storyboardMenu = UIStoryboard(name: "CustomLaunchViewController", bundle: nil)
        let jumpG = storyboardMenu.instantiateViewController(withIdentifier: "CustomLaunchViewController")
        self.navigationController?.pushViewController(jumpG, animated: true)
    }
    
    @IBAction func rateBut(_ sender: Any) {
        if #available(iOS 14.0, *) {
                        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                            SKStoreReviewController.requestReview(in: scene)
                        }
                    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "isSoundOff") {
            muteApplication()
        } else {
            unmuteApplication()
        }
        
    }
    
    func muteApplication() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default, options: .mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error muting application sound: \(error.localizedDescription)")
        }
    }

    func unmuteApplication() {
        do {
            try AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
        } catch {
            print("Error unmuting application sound: \(error.localizedDescription)")
        }
    }

    @IBAction func onPlay(_ sender: Any) {
        let w = ForGame()
        self.navigationController?.pushViewController(w, animated: false)
    }
    
}
