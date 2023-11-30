
import UIKit
import WebKit

class ReaderViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var tw: WKWebView!
    var type = 0
    @IBAction func onB(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
          return .portrait // Or use the orientation you want to lock to
      }

      // Disable auto-rotation
      override var shouldAutorotate: Bool {
          return false
      }
    
    @IBOutlet weak var tView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        if type == 0 {
            // Создание строки с HTML-кодом содержащим текст
                   let htmlString = """
                   <html>
                   <head>
                       <style>
                           body {
                               background-color: black; /* черный фон */
                               color: white; /* белый шрифт */
                               font-size: 50px; /* размер шрифта 16 */
                           }
                    p {
                               margin-bottom: 20px; /* Отступ между абзацами */
                           }
                       </style>
                   </head>
                   <body>
                   <p>Privacy Policy</p>
                   <p> This Privacy Policy applies to the Zahib Irshad developer (collectively “Company”, “we,” “us” or “our”) and describes how we handle and protect your personal data when you use our services (“Services”) and the choices available to you.
                   Zahib Irshad developer built the app as a Free app. This Service is provided by Zahib Irshad developer at no cost and is intended for use as is.
                   If you choose to use our Service, then you agree to the collection and use of information in accordance with this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.
                   The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible unless otherwise defined in this Privacy Policy.
                   Information We Collect and Use
                   We may collect the following information about you when you use our app:
                   • Information you provide to us directly: We may collect personal information that you provide to us directly, such as your name, email address, phone number, and any other information you choose to provide. Uses your email address only to respond to your communications on the official website or in form in mobile application but we can't identify users with email that was sent to our contact address.
                   • We collect information regarding the total sum of data transferred by all users of the app per country.
                   • We collect statistics to maintain our quality of service. We may know total statistics per regions and per servers but we can't identify this data with random users. We don't save and don't keep any data that can be uniquely identified with a specific user.
                   • We do not collect and use information about you and your device when you use our app, such as your IP address, device type, operating system version, and the dates and times that you access our app. It is important to note that it does not collect browsing history, traffic data, or DNS queries that could be used to identify any specific user.
                   • The app does use third-party services that may collect information used to identify you. Link to the privacy policy of third-party service providers used by the app: Google Analytics for Firebase.
                   Links to Other Sites
                   This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.
                   Children’s Privacy
                   These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13 years of age. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do the necessary actions.
                     
                    Changes to This Privacy Policy
                   We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.
                   Contact Us
                   If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at tariqmehmod1@hotmail.com</p>
                   </body>
                   </html>
                   """

                   // Загрузка HTML-страницы с текстом в WKWebView
                   tw.loadHTMLString(htmlString, baseURL: nil)
 
        } else {
            // Создание строки с HTML-кодом содержащим текст
                   let htmlString = """
                   <html>
                   <head>
                       <style>
                           body {
                               background-color: black; /* черный фон */
                               color: white; /* белый шрифт */
                               font-size: 50px; /* размер шрифта 16 */
                           }
                    p {
                               margin-bottom: 20px; /* Отступ между абзацами */
                           }
                       </style>
                   </head>
                   <body>
                   <p>Terms & Conditions</p>
                   <p> These terms of use (the "Terms") govern your access to and use of our app and services (the "Services"). By accessing or using the Services, you agree to be bound by these Terms and our Privacy Policy. If you do not agree to these Terms or the Privacy Policy, do not use the Services. The Services and all content and materials included on or comprising the Services, including, but not limited to, text, graphics, images, software, and videos, are the property of us or our licensors and are protected by copyright and other intellectual property laws. You’re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages or make derivative versions.
                   We reserve the right to modify, suspend, or discontinue the Services at any time, for any reason, and without notice. We will not be liable to you or any third party for any modification, suspension, or discontinuation of the Services.
                   We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.
                   We reserve the right to terminate or restrict your access to the Services at any time, for any reason, and without notice.
                   The app stores and processes personal data that you have provided to us, to provide our Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the app won’t work properly or at all.
                   The app does use third-party services that declare their Terms and Conditions. Link to Terms and Conditions of third-party service providers used by the app
                   • Google Analytics for Firebase Disclaimers
                   The Services are provided "as is" and "as available" without warranties of any kind, either express or implied, including, but not limited to, implied warranties of merchantability, fitness for a particular purpose, and non-infringement. We do not warrant that the Services will be uninterrupted or error-free.
                   Limitation of Liabilit
                   In no event will we be liable for any damages of any kind arising from the use of the Services, including, but not limited to, direct, indirect, incidental, punitive, and consequential damages.
                   Governing Law
                   These Terms and your use of the Services will be governed by and construed in accordance with the laws of the [state/province/country] in which the Services are provided, without giving effect to any principles of conflicts of law.
                   With respect to Zahib Irshad developer's responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavor to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. Zahib Irshad developer accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.
                    
                    At some point, we may wish to update the app. The app is currently available on iOS – the requirements for the system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. We do not promise that it will always update the app so that it is relevant to you and/or works with the iOS version that you have installed on your device.
                   However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you.
                   Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.
                   Changes to This Terms and Conditions
                   We reserve the right to modify these Terms at any time and without notice. Any changes to the Terms will be effective immediately upon posting. Your continued use of the Services after any changes to the Terms will constitute your acceptance of the revised Terms.
                   Contact Us
                   If you have any questions about these Terms or the Services, please contact us at tariqmehmod1@hotmail.com</p>
                   </body>
                   </html>
                   """

                   // Загрузка HTML-страницы с текстом в WKWebView
                   tw.loadHTMLString(htmlString, baseURL: nil)
        
        }

    }
    

}

