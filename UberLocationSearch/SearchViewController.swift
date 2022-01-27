//
//  SearchViewController.swift
//  UberLocationSearch
//
//  Created by 申民鐡 on 2022/01/21.
//

import UIKit

class SearchViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //system background컬러로 설정후
        view.backgroundColor = .secondarySystemBackground
        //위에서 label만든것을 addsubview에 추가시켜준다.
        view.addSubview(label)
        view.addSubview(field)

    }
    
    //subview가 표시될 때 마다 갱신함.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.sizeToFit()
        //라벨의 프레임 위치.
        label.frame = CGRect(x: 10, y: 10, width: label.frame.size.width, height: label.frame.size.height)
        //field의 프레임은 label보다 밑에 와야하기 때문에 y가 20+ 라벨위치이다          //사이즈도 view에서 20보다 작게 높이는 50으로 고정
        field.frame = CGRect(x: 10, y: 20+label.frame.size.height, width: view.frame.size.width-20, height: 50)
    }
}
