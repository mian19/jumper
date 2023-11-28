
import UIKit
import StoreKit
import AVFoundation
import AppTrackingTransparency
import OneSignalFramework

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
//        DispatchQueue.main.async {
//            OneSignal.Notifications.requestPermission({ accepted in
//                print("User accepted notifications: \(accepted)")
//            }, fallbackToSettings: true)
//
//                // Показываем второй алерт для запроса отслеживания, только если пользователь разрешил уведомления
//                if accepted {
        if #available(iOS 14, *) {
            switch ATTrackingManager.trackingAuthorizationStatus {
            case .notDetermined:
                // If the tracking authorization status is not determined, request authorization
                ATTrackingManager.requestTrackingAuthorization { status in
                    OneSignal.Notifications.requestPermission({ accepted in
                        print("User accepted notifications: \(accepted)")
                    }, fallbackToSettings: true)
                    switch status {
                    case .authorized:
                        // Tracking authorization dialog was shown and we are authorized
                        print("Authorized")
                    case .denied:
                        print("Denied")
                    case .notDetermined:
                        print("Not Determined")
                    case .restricted:
                        print("Restricted")
                    @unknown default:
                        print("Unknown")
                    }
                }
            default:
                break
                //                        }
                //                    }
                //                }
                //            }, fallbackToSettings: true)
            }
        }
//            if #available(iOS 14, *) {
//                ATTrackingManager.requestTrackingAuthorization { status in
//                    switch status {
//                    case .authorized:
//                        // Tracking authorization dialog was shown
//                        // and we are authorized
//                        print("Authorized")
//
//                    case .denied:
//
//                        print("Denied")
//                    case .notDetermined:
//                        print("Not Determined")
//
//                    case .restricted:
//                        print("Restricted")
//
//                    @unknown default:
//                        print("Unknown")
//                    }
//                }
//            }
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
    @IBAction func onTutor(_ sender: Any) {
        let storyboardMenu = UIStoryboard(name: "TutorViewController", bundle: nil)
        let jumpG = storyboardMenu.instantiateViewController(withIdentifier: "TutorViewController")
        self.navigationController?.pushViewController(jumpG, animated: false)
    }
    
}
