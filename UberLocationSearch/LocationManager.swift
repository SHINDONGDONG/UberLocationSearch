//
//  LocationManager.swift
//  UberLocationSearch
//
//  Created by 申民鐡 on 2022/01/21.
//

import Foundation
//Location을 사용 할 수 있게 임포트해준다.
import CoreLocation

//임의의 모델을 만들어줌.
struct Location {
    let title: String
    let coordinates: CLLocationCoordinate2D
}


                     //NSObject는 차차알아가자.
class LocationManager: NSObject {
    //항상 메모리에 띄어놓는다 LocationClass를
    static let shared = LocationManager()
    
    //위치 관리자_?
    let manager = CLLocationManager()
    
    //텍스트를 입력하고 눌렀을 때 위치를 찾을 수 있게 String과 핸들러를 escaping 배열로 담아준다.
    public func findLocations(with query: String, completion: @escaping(([Location]) -> Void)){
        
    }
}
