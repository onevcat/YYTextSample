//
//  ViewController.swift
//  YYTextSample
//
//  Created by WANG WEI on 2016/09/12.
//  Copyright © 2016年 OneV's Den. All rights reserved.
//

import UIKit
import YYText

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // This message will fail in iOS 10.
        let message = "あかさたなはまやらあかさたなはまや"
        
        // But this could work well by appending a space.
        // let message = "あかさたなはまやらあかさたなはまや "
        
        let messageFont = UIFont.systemFont(ofSize: 13.0)
        let messageAttr = message.attributedString(font: messageFont, textColor: .black)
        
        let name = "onevcat_live "
        let nameFont = UIFont.boldSystemFont(ofSize: 13.0)
        let result = NSMutableAttributedString(attributedString: name.attributedString(font: nameFont, textColor: .blue))
        result.append(messageAttr)
        
        let width: CGFloat = 295.0
        
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let layout = YYTextLayout(containerSize: size, text: result)
        
        let label = YYLabel(frame: CGRect(x: 0, y: 100, width: width, height: layout!.textBoundingSize.height))
        label.numberOfLines = 0
        
        // Set the attributedText in iOS 10 will cause the issue. But it works well for iOS 9
        label.attributedText = result
        
        // Setting textLayout instead could solve the issue.
        // label.textLayout = layout
        
        label.backgroundColor = .red
        
        view.addSubview(label)
    }
}

extension String {
    func attributedString(font: UIFont, textColor: UIColor?) -> NSAttributedString {
        
        var attributes: [String: AnyObject] = [NSFontAttributeName: font]
        
        // If we do not add a font attribute, it works well.
        // var attributes: [String: AnyObject] = [:]
        
        if let color = textColor {
            attributes[NSForegroundColorAttributeName] = color
        }
        return NSAttributedString(string: self, attributes: attributes)
    }
}

