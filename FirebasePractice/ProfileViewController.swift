//
//  ProfileViewController.swift
//  FirebasePractice
//
//  Created by 市川龍星 on 2018/08/31.
//  Copyright © 2018年 市川龍星. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didSelectLogout(_ sender: Any) {
        logout()
    }
    
    
    func logout() {
        
        //       let firebaseAuth = Auth.auth()
        //    do {
        //    try firebaseAuth.signOut()
        //    } catch let signOutError as NSError {
        //    print ("Error signing out: %@", signOutError)
        //    }
        
        do {
            //do-try-catchの中で、Auth.auth().signOut()を呼ぶだけで、ログアウトが完了
            try Auth.auth().signOut()
            
            //先頭のNavigationControllerに遷移
            let storyboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Nav")
            self.present(storyboard, animated: true, completion: nil)
        }catch let error as NSError {
            print("\(error.localizedDescription)")
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
