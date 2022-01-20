//
//  ViewController.swift
//  UberLocationSearch
//
//  Created by 申民鐡 on 2022/01/21.
//

import UIKit
//Apple MapKit을 사용할 수 있게 imort해준다.
import MapKit

class ViewController: UIViewController {

    //MKMapview를 사용할 수 있게 만들고
    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view위에 addview로 mapview를 깔아준다.
        view.addSubview(mapView)
    }
    
    //서브뷰가 셋업되고 난 후 호출됨.
    //서브뷰가 셋팅된 후 변경할 점이 있다면 여기서 수정하기 적합하다.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }


}

