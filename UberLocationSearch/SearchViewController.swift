//
//  SearchViewController.swift
//  UberLocationSearch
//
//  Created by 申民鐡 on 2022/01/21.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    //UI Label로 라벨을 작성 한다.
    private let label: UILabel = {
       let label = UILabel()
        label.text = "Where to?"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    //UITextfield를 선언.
    private let field: UITextField = {
        let field = UITextField()
        //placeholder
        field.placeholder = "Enter Description"
        //textfield의 모서리 둥글게
        field.layer.cornerRadius = 9
        //알아가보자
        field.backgroundColor = .tertiarySystemBackground
        //uiview로 넓이는 10 높이는 50이다.
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        return field
    }()
    
    //검색할 때 테이블뷰를 표시해준다.
    private let tableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    
    
    //위치를 담는 locations를 배열로 선언
    var locations = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //system background컬러로 설정후
        view.backgroundColor = .secondarySystemBackground
        //위에서 label만든것을 addsubview에 추가시켜준다.
        view.addSubview(label)
        view.addSubview(field)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .secondarySystemBackground
        field.delegate = self

    }
    
    //subview가 표시될 때 마다 갱신함.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.sizeToFit()
        //라벨의 프레임 위치.
        label.frame = CGRect(x: 10, y: 10, width: label.frame.size.width, height: label.frame.size.height)
        //field의 프레임은 label보다 밑에 와야하기 때문에 y가 20+ 라벨위치이다          //사이즈도 view에서 20보다 작게 높이는 50으로 고정
        field.frame = CGRect(x: 10, y: 20+label.frame.size.height, width: view.frame.size.width-20, height: 50)
        
        let tableY: CGFloat = field.frame.origin.y+field.frame.size.height+5
        tableView.frame = CGRect(x: 0, y: tableY, width: view.frame.size.width, height: view.frame.size.height-tableY)
    }
    
    
    //다시찾아보면서 해보기로
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        field.resignFirstResponder()
        if let text = field.text, !text.isEmpty {
            LocationManager.shared.findLocations(with: text) { [weak self] locations in
                DispatchQueue.main.async {
                    self?.locations = locations
                    self?.tableView.reloadData()
                }
            }
        }
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = locations[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        cell.contentView.backgroundColor = .secondarySystemBackground
        cell.backgroundColor = .secondarySystemBackground
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true )
        
        //위치를 지도에 알리고 계속 표시
        let coordinate = locations[indexPath.row].coordinates
    }
}
