

import UIKit
import WebKit

class WJUMP: UIViewController, WKNavigationDelegate {

    var wJ: WKWebView!
    var goJ: URL!
    
    let protectionSpace = URLProtectionSpace(host: "example.com", port: 0, protocol: "http", realm: nil, authenticationMethod: NSURLAuthenticationMethodHTTPBasic)
    var homePage: String!
    var hC: CGFloat = 0
    override var prefersStatusBarHidden: Bool {
        return true
    }

    var isAlredyJ = UserDefaults.standard.string(forKey: "alredyJ") == nil ? false : true

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            UIApplication.shared.isStatusBarHidden = true
        }
        let credential = URLCredentialStorage.shared.defaultCredential(for: protectionSpace)

              let userContentController = WKUserContentController()
              let script = "document.getElementById('username').value = '\(credential?.user ?? "")';document.getElementById('password').value = '\(credential?.password ?? "")';"
              let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
              userContentController.addUserScript(userScript)

              let configuration = WKWebViewConfiguration()
              configuration.userContentController = userContentController
      
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.windows.first {
                let safeAreaInsets = window.safeAreaInsets
                if safeAreaInsets.top > 20 {
                    hC = 80
                } else {
                   hC = 60
                }
            }
        }
        wJ = WKWebView(frame: .zero, configuration: configuration)
        view.addSubview(wJ)
        wJ.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(view.bounds.height - hC)
            make.top.equalToSuperview()
        }
        wJ.navigationDelegate = self

            let navView = UIView()
            view.addSubview(navView)
            view.bringSubviewToFront(navView)
            navView.translatesAutoresizingMaskIntoConstraints = false
            navView.backgroundColor = .black
       
        navView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(hC)
            make.bottom.equalToSuperview()
        }
                 
            let leftButton = UIButton()
                   if let leftImage = UIImage(systemName: "arrow.left") {
                       let scaledLeftImage = leftImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 34))
                       leftButton.setImage(scaledLeftImage, for: .normal)
                   }
                   leftButton.addTarget(self, action: #selector(onWebBQX), for: .touchUpInside)

                   let rightButton = UIButton()
                   if let rightImage = UIImage(systemName: "arrow.right") {
                       let scaledRightImage = rightImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 34))
                       rightButton.setImage(scaledRightImage, for: .normal)
                   }
                   rightButton.addTarget(self, action: #selector(onWebRQX), for: .touchUpInside)
        rightButton.tintColor = UIColor.lightGray
        leftButton.tintColor = UIColor.lightGray

        navView.addSubview(rightButton)
        navView.addSubview(leftButton)
        
        rightButton.snp.makeConstraints { make in
            make.centerY.equalTo(navView.snp.centerY)
            make.right.equalTo(navView.snp.right).offset(-30)
        }
        
        leftButton.snp.makeConstraints { make in
              make.centerY.equalTo(navView.snp.centerY)
              make.left.equalTo(30)
          }
 
            let request = URLRequest(url: goJ)
            wJ.load(request)
    }
    
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let strUrl = webView.url?.absoluteString else { return }
        print(strUrl)
        if !isAlredyJ {
            UserDefaults.standard.set(strUrl, forKey: "alredyJ")
            isAlredyJ = true
        }
    }
    
    @objc func onWebBQX() {
        wJ.goBack()
    }
    
    @objc func onWebRQX() {
        wJ.goForward()
    }
}

import SnapKit
class ForGame: UIViewController, WKNavigationDelegate {
    var goJump: WKWebView!
    var blV: UIView!
    var backB: UIButton!
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
          return .portrait // Or use the orientation you want to lock to
      }

      // Disable auto-rotation
      override var shouldAutorotate: Bool {
          return false
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // Create a UIWebView
        let val: CGFloat = UIScreen.main.bounds.width < 380 ? 30 : 10
        blV = UIView(frame: CGRect(x: 0, y: 0, width: Int(view.frame.width), height: UIScreen.main.bounds.width < 380 ? 40: 105))
        blV.backgroundColor = .black
        goJump = WKWebView(frame: CGRect(x: view.frame.minX - val, y: UIScreen.main.bounds.width < 380 ? view.frame.minY - val + 10 : view.frame.minY - val, width: view.frame.width + val * 2, height: view.frame.height + val * 2))
        goJump.isHidden = true
        goJump.navigationDelegate = self
        goJump.backgroundColor = .black
        backB = UIButton(type: .custom)
        backB.setImage(UIImage(named: "backB"), for: .normal)
        blV.addSubview(backB)
        backB.addTarget(self, action: #selector(toHome), for: .touchUpInside)
        backB.snp.makeConstraints { make in
            make.width.height.equalTo(32)
            make.bottom.equalTo(blV.snp.bottom)
            make.left.equalToSuperview().offset(32)
        }
        view.addSubview(goJump)
        view.addSubview(blV)
        // Load a URL in the webview (for example)
        if let url = URL(string: "https://preview.codecanyon.net/item/stick-jump-html5-mobile-game-android-ios/full_screen_preview/25558822?_ga=2.892981.582885592.1701124564-2013591962.1700600824") {
            let request = URLRequest(url: url)
            goJump.load(request)
        }
    }
    
    @objc func toHome() {
        self.navigationController?.popViewController(animated: false)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.goJump.isHidden = false
        }
    }
}
