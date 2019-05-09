//
//  TextViewCell.swift
//  URLImageTextAttachmentSample
//
//  Created by Jahyun Oh on 08/05/2019.
//  Copyright © 2019 Jahyun Oh. All rights reserved.
//

import UIKit

class TextViewCell: UITableViewCell {
    static let reuseID = String(describing: self)
    static let cellHeight = CGFloat(50)

    let textView = UITextView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String? = TextViewCell.reuseID) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(textView)
        textView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview().inset(5)
        }
        textView.backgroundColor = .yellow
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
