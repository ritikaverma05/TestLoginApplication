//
//  LogInViewController.swift
//  BlackcofferApplication
//
//  Created by RITIKA VERMA on 20/03/21.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

class LogInViewController: UIViewController {

    @IBOutlet weak var FacebookLoginBtn: FBLoginButton!
    @IBOutlet weak var GoogleSignInBtn: UIButton!
    @IBOutlet weak var EmailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setups()
        facebookLogin()
        googleLogin()
        
    }
    
    func setups(){
        GoogleSignInBtn.layer.borderWidth = 2
        GoogleSignInBtn.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    @IBAction func LogInBtn(_ sender: UIButton) {
        
        if(checkValidity()){

            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecurityCheckViewController")
            vc?.modalTransitionStyle = .flipHorizontal
            vc?.modalPresentationStyle = .fullScreen
            self.present(vc!, animated: true, completion: nil)
        }
    }
    
    func checkValidity() -> Bool{
        
        if((EmailTextField.text?.isEmailValid)!){
            return true
        }else{
            print(" not valid")
            self.showError(error: "Invalid Email", duration: 2.0)
        }
        return false
    }

    @IBAction func GoogleBtnTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    

    @IBAction func SignUpBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController")
        vc?.modalTransitionStyle = .flipHorizontal
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func rememberMeBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected{
            sender.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        }else{
            sender.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
    }
    
    func facebookLogin(){
        
        if let token = AccessToken.current,
           !token.isExpired {
            // User is logged in, do work such as go to next view controller.
            let token = token.tokenString
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email,name"], tokenString: token, version: nil, httpMethod: .get)
            request.start{ (connection, result, error) in
                print("\(result)")
                print("Dvhsbhf")
                let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeTabBarController")
                vc.modalTransitionStyle = .flipHorizontal
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }else{
            FacebookLoginBtn.permissions = ["public_profile", "email"]
            FacebookLoginBtn.delegate = self
        }
    }
    
    func googleLogin(){
        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
        
        if ((GIDSignIn.sharedInstance()?.hasPreviousSignIn()) != nil)
        {
            print("Already Login through Google")
            let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeTabBarController")
            vc.modalTransitionStyle = .flipHorizontal
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
    }

}
extension LogInViewController: LoginButtonDelegate{
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email,name"], tokenString: token, version: nil, httpMethod: .get)
        request.start{ (connection, result, error) in
            print("\(result)")
            
            if result != nil{
                let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeTabBarController")
                vc.modalTransitionStyle = .flipHorizontal
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Logout")
    }
}

extension LogInViewController: GIDSignInDelegate{
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        print("\(user.profile.email ?? "No email" )")
        if let error = error {
          if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
              self.showError(error: "The user has not signed in before or they have since signed out.", duration: 2.0)
          } else {
              self.showError(error: error.localizedDescription, duration: 2.0)
            print("\(error.localizedDescription)")
          }
          return
        }
        
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeTabBarController")
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
 
}
