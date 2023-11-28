
import UIKit
import OneSignalFramework

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        OneSignal.initialize("004fbf49-d980-473f-94ac-b5a0156848c6", withLaunchOptions: launchOptions)
        OneSignal.Notifications.requestPermission({ accepted in
           print("User accepted notifications: \(accepted)")
         }, fallbackToSettings: true)
       
        runningJump()
        return true
    }

//    var alredyQX = UserDefaults.standard.string(forKey: "alredyQX")
//    var alw = UserDefaults.standard.bool(forKey: "alw")
//    var urQX2 = "https://profitbinaryhub.com/XcPYQn"
//    var urQX = "https://google.com"

    func runningJump() {
        DispatchQueue.main.async {
            let storyboardMenu = UIStoryboard(name: "StartViewControllerJUMP", bundle: nil)
            let jumpG = storyboardMenu.instantiateViewController(withIdentifier: "StartViewControllerJUMP")
                let firstNavigationController = UINavigationController()
                firstNavigationController.navigationBar.isHidden = true
                firstNavigationController.pushViewController(jumpG, animated: true)
                self.window?.rootViewController = firstNavigationController
                self.window?.makeKeyAndVisible()
        }
    
    }

}

