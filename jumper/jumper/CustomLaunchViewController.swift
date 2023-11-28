
import UIKit
import AVFoundation

class CustomLaunchViewController: UIViewController {

    @IBOutlet weak var musicBut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if  UserDefaults.standard.bool(forKey: "isSoundOff") {
            musicBut.setImage(UIImage(named: "Property 1=sound_mute"), for: .normal)
        } else {
            musicBut.setImage(UIImage(named: "Property 1=sound_max"), for: .normal)
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

    @IBAction func onPriv(_ sender: Any) {
        let storyboardMenu = UIStoryboard(name: "ReaderViewController", bundle: nil)
        let jumpG = storyboardMenu.instantiateViewController(withIdentifier: "ReaderViewController")
       
        self.navigationController?.pushViewController(jumpG, animated: true)
    }
    
    @IBAction func onTerms(_ sender: Any) {
        let storyboardMenu = UIStoryboard(name: "ReaderViewController", bundle: nil)
        let jumpG = storyboardMenu.instantiateViewController(withIdentifier: "ReaderViewController")
        if let ju = jumpG as? ReaderViewController {
            ju.type = 1
        }
        self.navigationController?.pushViewController(jumpG, animated: true)
    }
    
    @IBAction func onMusic(_ sender: Any) {
        let old = UserDefaults.standard.bool(forKey: "isSoundOff")
        if old {
            musicBut.setImage(UIImage(named: "Property 1=sound_max"), for: .normal)
            UserDefaults.standard.setValue(false, forKey: "isSoundOff")
            unmuteApplication()
        } else {
            musicBut.setImage(UIImage(named: "Property 1=sound_mute"), for: .normal)
            UserDefaults.standard.setValue(true, forKey: "isSoundOff")
            muteApplication()
        }
    }
    @IBAction func toHome(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
