//
//  ViewController.swift
//  dohomeworkAlert
//
//  Created by Dương chãng on 4/29/20.
//  Copyright © 2020 macshop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let iamgeView : UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image =  UIImage(named: "coronavirus")
        imageview.layer.borderWidth=1.0
        imageview.layer.masksToBounds = false
        imageview.layer.borderColor = #colorLiteral(red: 0.5679820826, green: 1, blue: 0.3943299117, alpha: 1)
        //imageview.layer.cornerRadius = imageview.frame.size.height/2
        imageview.clipsToBounds = true
        return imageview
    }()
    
    let Viewbig : UIView = {
        let Viewbig = UIView()
        Viewbig.translatesAutoresizingMaskIntoConstraints = false
        Viewbig.backgroundColor = #colorLiteral(red: 0.5679820826, green: 1, blue: 0.3943299117, alpha: 1)
        return Viewbig
    }()
    let btnLogin : UIButton = {
        let btnLogin = UIButton()
        btnLogin.translatesAutoresizingMaskIntoConstraints = false
        btnLogin.setTitle("Login🌹", for: .normal)
        btnLogin.setTitleColor(#colorLiteral(red: 1, green: 0.1549909391, blue: 0.1438000077, alpha: 1), for: .normal)
        btnLogin.layer.borderColor = #colorLiteral(red: 0.3666456616, green: 0.3285583755, blue: 1, alpha: 1)
        btnLogin.layer.borderWidth = 3
        btnLogin.layer.cornerRadius = 10
        btnLogin.titleLabel?.textAlignment = .center
        return btnLogin
        
    }()
    
    let btnlogout : UIButton = {
        let btnlogout = UIButton()
        btnlogout.translatesAutoresizingMaskIntoConstraints = false
        btnlogout.setTitle("LogOut🚗", for: .normal)
        btnlogout.setTitleColor(#colorLiteral(red: 1, green: 0.1549909391, blue: 0.1438000077, alpha: 1), for: .normal)
        btnlogout.layer.borderWidth = 3
        btnlogout.layer.borderColor = #colorLiteral(red: 0.3666456616, green: 0.3285583755, blue: 1, alpha: 1)
        btnlogout.layer.cornerRadius = 10
        btnlogout.titleLabel?.textAlignment = .center
        return btnlogout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setuplayout()
        // taoj hành động cho button
        btnLogin.addTarget(self, action: #selector(UIAlert), for: .touchUpInside)
        
        
    }

    func setuplayout(){
        view.addSubview(Viewbig)
        Viewbig.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        Viewbig.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        Viewbig.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        Viewbig.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        view.addSubview(iamgeView)
        iamgeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        iamgeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        iamgeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        iamgeView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.addSubview(btnLogin)
    
        btnLogin.topAnchor.constraint(equalTo: iamgeView.bottomAnchor, constant: 70).isActive = true
        btnLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64).isActive = true
        btnLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64).isActive = true
        btnLogin.heightAnchor.constraint(equalToConstant: 60 ).isActive = true
        
        view.addSubview(btnlogout)
        btnlogout.topAnchor.constraint(equalTo: btnLogin.bottomAnchor, constant: 30).isActive = true
        btnlogout.trailingAnchor.constraint(equalTo: Viewbig.trailingAnchor, constant: -64).isActive = true
        btnlogout.leadingAnchor.constraint(equalTo: Viewbig.leadingAnchor, constant: 64).isActive = true
        btnlogout.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }

    @objc func UIAlert(){
        
        // khởi tao alert
        let alert: UIAlertController = UIAlertController(title: "Thông báo", message: "Vui lòng nhập thông tin", preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField { (txtemail) in
            txtemail.placeholder = "✉️ Nhập Email của bạn"
        }
        
        alert.addTextField { (txtpass) in
            txtpass.placeholder = "🔒 Nhập password"
            txtpass.isSecureTextEntry = true
        }
        
        let butonlogin: UIAlertAction = UIAlertAction(title: "Đăng nhập", style: .destructive) { (btnlogin) in
        // kiểm tra
            // khai báo biên email = vs textfields ở vị trí thứ 0
            //khai báo biên pass = vs textfields ở vị trí thứ 1
            let Email : String = alert.textFields![0].text!
            let Pass: String   = alert.textFields![1].text!
            
            if Email == "Dương Chãng" && Pass == "1234567"
            {
                self.hienthiketqua(mess: "Đăng nhập thành công")
                //print("Đăng nhập thành công")
            }else{
                self.hienthiketqua(mess: "Đăng nhập không thành công")
                //print("Đăng nhập không thành công")
            }
            
        }
        
        let btnlogout: UIAlertAction = UIAlertAction(title: "Huỷ", style: .cancel) { (btncancell) in
            
        }
        
        
        // thêm hai nut button vào alert
        alert.addAction(butonlogin)
        alert.addAction(btnlogout)
        present(alert, animated: true, completion: nil)
    }
    
    // tạo ra một cái uialert trả vê thông báo với mess :String

    func hienthiketqua(mess: String) {
        // tạo ra title và message vs mess: String để chạy trong hàm If
        let alert: UIAlertController = UIAlertController(title: "Thông Báo", message: mess, preferredStyle: UIAlertController.Style.alert)
        // khơi tạo nut button ok
        let buttonOk : UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(buttonOk)
        // hiển thị ô alert lên
        present(alert, animated: true, completion: nil)
    }
    
    
    }
    

