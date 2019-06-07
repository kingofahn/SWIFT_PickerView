//
//  ViewController.swift
//  PickerView
//
//  Created by kingofahn on 07/06/2019.
//  Copyright © 2019 kingofahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    let PICKER_VIEW_COLUMN = 1
    var imageArray = [UIImage?]()
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var imageFileName = [ "01.jpg", "02.jpg", "03.jpg", "04.jpg", "05.jpg", "06.jpg", "07.jpg", "08.jpg"]

    @IBOutlet var pickerImage: UIPickerView!
    
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0 ..< imageFileName.count {
            imageArray.append(UIImage(named: imageFileName[i]))
        }
        lblImageFileName.text = imageFileName[0] // 첫 번째 파일명을 출력
        imageView.image = imageArray[0] // 첫 번째 이미지를 출력
    }
    
    // 피커 뷰의 컴포넌트는 피커 뷰에 표시되는 열의 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // 열에서 선택할 수 있는 행의 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return imageFileName.count
    }
    
    /*
    // 피커 뷰 룰렛에 파일명 출력 (imageFileName에 저장되어 있는 파일명)
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row]
    }
    */
    
    // 피커 뷰 룰렛에 파일명 대신 이미지 출력
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image:imageArray[row]) // 선택된 row에 해당되는 이미지를 imageArray에 가져옴
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150) // 이미지 뷰의 프레임 크기를 설정
        
        return imageView
    }
    
    // 이미지뷰에 이미지 표시
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
    
    // 룰렛의 높이를 받음
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
}

