//
//  SignupViewController.swift
//  FirebasePractice
//
//  Created by 市川龍星 on 2018/08/24.
//  Copyright © 2018年 市川龍星. All rights reserved.
//

import UIKit
import Firebase


class SignupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //ログインしていれば、遷移
        //FIRAuthがユーザー認証のためのフレーム
        //checkUserVerifyでチェックして、ログイン済みなら画面遷移
        if self.checkUserVerify() {
            self.transitionToView()
        }
        
    }
    
    // ログイン済みかどうかと、メールのバリデーションが完了しているか確認
    func checkUserVerify()  -> Bool {
        guard let user = Auth.auth().currentUser else { return false }
        return user.isEmailVerified
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func willSignup(_ sender: Any) {
        signUp()
    }
    
    
    @IBAction func willTransitionToLogin(_ sender: Any) {
        transitionToLogin()
    }
    

    func transitionToLogin() {
        self.performSegue(withIdentifier: "toLogin", sender: self)
    }
    
    func transitionToView() {
        self.performSegue(withIdentifier: "toView", sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
//    func signUp() {
//        guard let email = emailTextField.text else {return}
//        guard let password = passwordTextField.text else {return}
//
//        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user, error) in
//            if error == nil {
//                self.transitionToLogin()
//
//            })
//        }else{
//            print("\(error?.localizedDescription)")
//        }
//
//    }
    
    func signUp() {
        //emailTextFieldとpasswordTextFieldに文字がなければ、その後の処理をしない
        guard let email = emailTextField.text else  { return }
        guard let password = passwordTextField.text else { return }
        //FIRAuth.auth()?.createUserWithEmailでサインアップ
        //第一引数にEmail、第二引数にパスワード
        
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            //エラーなしなら、認証完了
            if error == nil  {
                Auth.auth().currentUser?.sendEmailVerification { (error) in
                    if error == nil {
                        // エラーがない場合にはそのままログイン画面に飛び、ログインしてもらう
                        self.transitionToLogin()
                    }else {
                        print("\(error?.localizedDescription)")
                    }
                }
                
//                // エラーがない場合にはそのままログイン画面に飛び、ログインしてもらう
//                self.transitionToLogin()
                
            } else {
            
            print("\(error?.localizedDescription)")
        }
            
        }
        
            }
    
//    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
//    //エラーなしなら、認証完了
//    if error == nil{
//    // エラーがない場合にはそのままログイン画面に飛び、ログインしてもらう
//    self.transitionToLogin()
//    })
//    }else {
//
//    print("\(error?.localizedDescription)")
//    }
//    })
//}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
