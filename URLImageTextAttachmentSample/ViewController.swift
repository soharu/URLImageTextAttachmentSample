//
//  ViewController.swift
//  URLImageTextAttachmentSample
//
//  Created by Jahyun Oh on 01/05/2019.
//  Copyright © 2019 Jahyun Oh. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

        let font = UIFont.systemFont(ofSize: 25)
        let attrubtedString = NSMutableAttributedString()
        attrubtedString.append(NSAttributedString(string: "I'm TextView."))
        attrubtedString.addAttributes([ .font: font ], range: NSRange(location: 0, length: attrubtedString.length))

        let textView = UITextView()
        textView.attributedText = attrubtedString

        view.addSubview(textView)
        textView.snp.makeConstraints { (maker) in
            maker.leading.trailing.equalToSuperview().inset(20)
            maker.height.equalToSuperview().multipliedBy(0.6)
            maker.centerY.equalToSuperview()
        }
    }
}
