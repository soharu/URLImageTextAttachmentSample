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
    private let items: [Any] = [
        URL(string: "https://avatars0.githubusercontent.com/u/1327853")!,
        "Hello, World\n",
        "Read these books:",
        URL(string: "https://www.tuestudy.org/images/jmbook2.png")!, " ",
        URL(string: "https://www.tuestudy.org/images/500l-lines.png")!, " ",
        URL(string: "https://www.tuestudy.org/images/aosabook-vol.2.jpg")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

        let textView = UITextView()
        textView.attributedText = buildAttrubtedString()

        view.addSubview(textView)
        textView.snp.makeConstraints { (maker) in
            maker.leading.trailing.equalToSuperview().inset(20)
            maker.height.equalToSuperview().multipliedBy(0.6)
            maker.centerY.equalToSuperview()
        }
    }

    private func buildAttrubtedString() -> NSAttributedString {
        let placeholder = UIImage(color: .lightGray, size: CGSize(width: 50, height: 50))!
        let font = UIFont.systemFont(ofSize: 25)
        let attrubtedString = NSMutableAttributedString()

        items.forEach { (item) in
            switch item {
            case let url as URL:
                let attachement = URLImageTextAttachment(url: url, placeholderImage: placeholder, fitTo: font)
                attrubtedString.append(NSAttributedString(attachment: attachement))
            case let text as String:
                attrubtedString.append(NSAttributedString(string: text))
            default:
                break
            }
        }
        attrubtedString.addAttributes([ .font: font ], range: NSRange(location: 0, length: attrubtedString.length))
        return attrubtedString
    }
}
