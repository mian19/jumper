
import UIKit
import StoreKit
import AVFoundation
import AppTrackingTransparency
import OneSignalFramework
import Alamofire

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
             
            }
        }

        // Запретить автоматическую смену ориентации на этом экране
            UIDevice.current.beginGeneratingDeviceOrientationNotifications()
            NotificationCenter.default.addObserver(self, selector: #selector(restrictRotation), name: UIDevice.orientationDidChangeNotification, object: nil)
        }

        deinit {
            // Разрешить автоматическую смену ориентации на других экранах
            UIDevice.current.endGeneratingDeviceOrientationNotifications()
            NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
        }
    // Ограничение ориентации для этого экрана
     @objc func restrictRotation() {
         if UIDevice.current.orientation != .portrait {
             UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
         }
     }

     override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
         return .portrait
     }

     override var shouldAutorotate: Bool {
         return false
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
        if (NetworkState().isInternetAvailable) {
            let w = ForGame()
            self.navigationController?.pushViewController(w, animated: false)
        } else {
            showAlert(message: "Internet connection is unavailable.")

        }
    }
    @IBAction func onTutor(_ sender: Any) {
        let storyboardMenu = UIStoryboard(name: "TutorViewController", bundle: nil)
        let jumpG = storyboardMenu.instantiateViewController(withIdentifier: "TutorViewController")
        self.navigationController?.pushViewController(jumpG, animated: false)
    }
    
    func showAlert(message: String) {
           let alertController = UIAlertController(title: "Turn on the internet", message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alertController.addAction(okAction)
           present(alertController, animated: true, completion: nil)
       }
}

class InitialViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Устанавливаем ориентацию в портретный режим для этого view controller'а
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        let imV = UIImageView(frame: view.frame)
        imV.image = UIImage(named: "Loading")
        imV.contentMode = .scaleToFill
        view.addSubview(imV)
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
}
