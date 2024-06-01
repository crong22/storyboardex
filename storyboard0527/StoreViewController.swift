//
//  StoreViewController.swift
//  storyboard0527
//
//  Created by 여누 on 5/28/24.
//

import UIKit
import Kingfisher



class StoreViewController: UIViewController, UITabBarDelegate, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var findTextField: UITextField!
    @IBOutlet var findButton: UIButton!
    
    @IBOutlet var allButton: UIButton!
    @IBOutlet var hanButton: UIButton!
    @IBOutlet var jaButton: UIButton!
    @IBOutlet var kyButton: UIButton!
    @IBOutlet var yaButton: UIButton!
    @IBOutlet var chButton: UIButton!
    @IBOutlet var scButton: UIButton!
    @IBOutlet var caButton: UIButton!
    
    @IBOutlet var tableView: UITableView!
    
    var store = RestaurantList.restaurantArray
    var like = RestaurantList.restaurantArray
    var textname = RestaurantList.restaurantArray
    var list = RestaurantList.restaurantArray {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        findTextField.layer.borderWidth = 2
        
        
        findButton.setTitle("조회", for: .normal)
        findButton.layer.borderWidth = 2
       
        allButton.setTitle("전체", for: .normal)
        allButton.layer.borderWidth = 2
        allButton.layer.cornerRadius = 10
        
        hanButton.setTitle("한식", for: .normal)
        hanButton.layer.borderWidth = 2
        hanButton.layer.cornerRadius = 10
//        hanButton.titleLabel?.font = .systemFont(ofSize: 14)
        jaButton.setTitle("일식", for: .normal)
        jaButton.layer.borderWidth = 2
        jaButton.layer.cornerRadius = 10
        kyButton.setTitle("경양", for: .normal)
        kyButton.layer.borderWidth = 2
        kyButton.layer.cornerRadius = 10
        yaButton.setTitle("양식", for: .normal)
        yaButton.layer.borderWidth = 2
        yaButton.layer.cornerRadius = 10
        chButton.setTitle("중식", for: .normal)
        chButton.layer.borderWidth = 2
        chButton.layer.cornerRadius = 10
        scButton.setTitle("분식", for: .normal)
        scButton.layer.borderWidth = 2
        scButton.layer.cornerRadius = 10
        caButton.setTitle("카페", for: .normal)
        caButton.layer.borderWidth = 2
        caButton.layer.cornerRadius = 10
        
        tableView.rowHeight = 150
        

        print(list[0].like)
        
    }
    
    //1번버튼 한식 클릭했을 때 액션
    @IBAction func hanButtonClicked(_ sender: UIButton) {
        var korean : [Restaurant] = []
        print("한식클릭")
        for i in store {
            if i.category == "한식"{
                korean.append(i)
            }
        }
        list = korean
        
    }
    //2번버튼 한식 클릭했을 때 액션
    @IBAction func jaButtonClicked(_ sender: UIButton) {
        var japanse : [Restaurant] = []
        print("일식클릭")
        for i in store {
            if i.category == "일식"{
                japanse.append(i)
            }
        }
        list = japanse

    }
    
    //3번버튼 경양 클릭했을 때 액션
    @IBAction func kyButtonClicked(_ sender: UIButton) {
        var lightWestern : [Restaurant] = []
        print("경양클릭")
        for i in store {
            if i.category == "경양"{
                lightWestern.append(i)
            }
        }
        list = lightWestern
    }
    
    //4번버튼 양식 클릭했을 때 액션
    @IBAction func westernButtonClicked(_ sender: UIButton) {
        var western : [Restaurant] = []
        print("양식클릭")
        for i in store {
            if i.category == "경양"{
                western.append(i)
            }
        }
        list = western
    }
    
    //5번버튼 중식 클릭했을 때 액션
    @IBAction func chineseButtonClicked(_ sender: UIButton) {
        var chinese : [Restaurant] = []
        print("중식클릭")
        for i in store {
            if i.category == "중식"{
                chinese.append(i)
            }
        }
        list = chinese
    }
 
    //6번버튼 분식 클릭했을 때 액션
    @IBAction func scButtonClicked(_ sender: UIButton) {
        var sc : [Restaurant] = []
        print("분식클릭")
        for i in store {
            if i.category == "분식"{
                sc.append(i)
            }
        }
        list = sc
    }
    
    //7번버튼 카페 클릭했을 때 액션
    @IBAction func cafeButtonClicked(_ sender: UIButton) {
        var cafe : [Restaurant] = []
        print("카페클릭")
        for i in store {
            if i.category == "카페"{
                cafe.append(i)
            }
        }
        list = cafe
    }
    
    @IBAction func allButtonClicked(_ sender: UIButton) {
        var all : [Restaurant] = []
        print("전체클릭")
        for i in store {
            all.append(i)
        }
        list = all
    }
    
    @IBAction func findButtonClicked(_ sender: UIButton) {
        //  빈 리스트 생성
        var title : [Restaurant] = []
        // 텍스트필드에 입력받은 값 저장
        var storename = findTextField.text!

        // for문을 사용해서 포함하는지 여부 확인
        for text in textname {
            if text.name.contains(storename) {
                title.append(text)
            }
        }

        list = title
    }
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: "StoreInfoTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "StoreInfoTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    func tableView(_ tableView:
                   UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreInfoTableViewCell", for: indexPath) as! StoreInfoTableViewCell
        
        var data = list[indexPath.row]
      
        
        cell.nameLabel.text = data.name
        cell.nameLabel.font = .boldSystemFont(ofSize: 17)
        cell.nameLabel.textAlignment = .left
        cell.nameLabel.textColor = .black
        
        cell.addLabel.text = data.address
        cell.addLabel.font = .systemFont(ofSize: 14)
        cell.addLabel.textAlignment = .left
        cell.addLabel.textColor = .lightGray
        
        let url = URL(string: data.image)
        cell.mainImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star"))
        cell.mainImageView.contentMode = .scaleAspectFill
        
        
        
       
        let name = data.like ? "heart.fill" : "heart"
        let image = UIImage(systemName: name)
        cell.likeButton.setImage(image, for: .normal)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        UserDefaults.standard.set(data.like, forKey: "like")
//        var like = UserDefaults.standard.bool(forKey: "like")
//        
//        data.like = like

        return cell
        
    }
    @objc func likeButtonClicked(sender : UIButton) {
        // toggle을 사용하여 클릭할 때마다 false / true 변경
        list[sender.tag].like.toggle()

        //tableView.reloadData()
//        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
}
                                  
                                  
                                  
