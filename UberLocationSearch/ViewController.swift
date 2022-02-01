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
import CoreLocation

class ViewController: UIViewController, SearchViewControllerDelegate {

    //MKMapview를 사용할 수 있게 만들고
    let mapView = MKMapView()
    
    let panel = FloatingPanelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view위에 ad dview로 mapview를 깔아준다.
        view.addSubview(mapView)
        //Navi바의 타이틀을 넣어줌으로 써 좀더 멋을 살렸다. 지림
        self.title = "Uber"
        
        //Floatingpanel컨트롤러를 선언.

        let searchVC = SearchViewController()
        searchVC.delegate = self
        panel.set(contentViewController: searchVC)
        //viewcontroller가 부모이고 to로 가는곳이 Search 컨트롤러
        panel.addPanel(toParent: self)
        
        
        
    }
    
    //서브뷰가 셋업되고 난 후 호출됨.
    //서브뷰가 셋팅된 후 변경할 점이 있다면 여기서 수정하기 적합하다.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }
    
    
    //protocol을 오버로딩해서 가져오고 실제로 viewcontroller에서 일어날 일들을 선언해준다.
    func searchViewController(_ vc: SearchViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?) {
        
        //pannel이 move 하여축소된다 (검색하는순간)
        panel.move(to: .tip, animated: true, completion: nil)
        
        //annotations는 맵뷰에 핀을꽂아 장소를 설정하는것을 말한다.
        mapView.removeAnnotations(mapView.annotations)
        
        guard let coordinates = coordinates else{
            return
        }
        //pin을 선언
        let pin = MKPointAnnotation()
        pin.coordinate  = coordinates
        mapView.addAnnotation(pin)
        //지도에 좌표를 추적할 수있는 MKCoordinateRegion,에 좌표를 입력하고
        mapView.setRegion(MKCoordinateRegion(center: coordinates,
                                             //mkcoordinateSpan은 지도의 scale을 정할 수 있다.
                                             span: MKCoordinateSpan(
                                                latitudeDelta: 0.05,
                                                longitudeDelta: 0.05
                                             )
                                            ),
                          animated: true)

    }
    
}

