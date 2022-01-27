//
//  ViewController.swift
//  UberLocationSearch
//
//  Created by 申民鐡 on 2022/01/21.
//

import UIKit
//Apple MapKit을 사용할 수 있게 imort해준다.
import MapKit
import FloatingPanel

class ViewController: UIViewController {

    //MKMapview를 사용할 수 있게 만들고
    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view위에 ad dview로 mapview를 깔아준다.
        view.addSubview(mapView)
        //Navi바의 타이틀을 넣어줌으로 써 좀더 멋을 살렸다. 지림
        self.title = "Uber"
        
        //Floatingpanel컨트롤러를 선언.
        let panel = FloatingPanelController()
        panel.set(contentViewController:  SearchViewController())
        //viewcontroller가 부모이고 to로 가는곳이 Search 컨트롤러
        panel.addPanel(toParent: self)
        
        
        
    }
    
    //서브뷰가 셋업되고 난 후 호출됨.
    //서브뷰가 셋팅된 후 변경할 점이 있다면 여기서 수정하기 적합하다.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }


}

